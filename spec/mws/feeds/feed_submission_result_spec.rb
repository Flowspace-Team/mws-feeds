# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MWS::Feeds::FeedSubmissionResult do
  let(:instance) { described_class.new(node, namespace: nil) }

  let(:success_node) { load_xml_fixture('feed_submission_result_success').xpath('//ProcessingReport').first }
  let(:errors_node) { load_xml_fixture('feed_submission_result_errors').xpath('//ProcessingReport').first }

  let(:node) { success_node }

  subject { instance }

  it { is_expected.to be_a(MWS::Feeds::FeedSubmissionResult) }

  describe "#processing_summary" do
    subject { instance.processing_summary }

    context "with the successful fixture" do
      let(:node) { success_node }

      it { is_expected.to be_a(MWS::Feeds::ProcessingSummary) }

      it {
        is_expected.to have_attributes(
          messages_processed: 6,
          messages_successful: 6,
          messages_with_error: 0,
          messages_with_warning: 0,
        )
      }
    end

    context "with the errors fixture" do
      let(:node) { errors_node }

      it { is_expected.to be_a(MWS::Feeds::ProcessingSummary) }

      it {
        is_expected.to have_attributes(
          messages_processed: 1,
          messages_successful: 0,
          messages_with_error: 1,
          messages_with_warning: 0,
        )
      }
    end
  end

  describe "#results" do
    subject { instance.results }

    context "with the successful fixture" do
      let(:node) { success_node }

      it { is_expected.to be_a(MWS::Feeds::Collection) }
      it { is_expected.to have_attributes(count: 0) }
    end

    context "with the errors fixture" do
      let(:node) { errors_node }

      it { is_expected.to have_attributes(count: 1) }

      it {
        is_expected.to all have_attributes(
          message_id: 1,
          result_code: 'Error',
          result_message_code: 18028,
          result_description: 'Your order cannot be found using Merchant ID 12345678901 and Merchant Order '\
                              '112-1111111-1111111. Enter the correct order ID and then resubmit your feed.',
        )
      }
    end
  end
end
