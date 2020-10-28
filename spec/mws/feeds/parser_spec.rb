# frozen_string_literal: true

require 'spec_helper'
require 'net/http'

RSpec.describe MWS::Feeds::Parser do
  let(:instance) { described_class.new(response, 'UTF-8') }
  let(:response) { instance_double(::Net::HTTPResponse,  body: body) }

  subject { instance }

  describe '#parse' do
    subject { instance.parse }

    context 'GetFeedSubmissionCount' do
      let(:body) { load_fixture('feed_submission_count') }

      it { is_expected.to be_a(MWS::Feeds::FeedSubmissionCount) }
      it { is_expected.to have_attributes(count: 0) }
    end

    context 'GetFeedSubmissionListResult' do
      let(:body) { load_fixture('get_feed_submission_list') }

      it { is_expected.to be_a(MWS::Feeds::FeedSubmissionList) }
      it { is_expected.to have_attributes(count: 2) }
      it { is_expected.to all be_a(MWS::Feeds::FeedSubmissionInfo) }
    end

    context 'FeedSubmissionResult' do
      let(:body) { load_fixture('feed_submission_result_errors') }

      it { is_expected.to be_a(MWS::Feeds::FeedSubmissionResult) }

      it {
        is_expected.to have_attributes(
          processing_summary: have_attributes(
            messages_processed: 1,
            messages_successful: 0,
            messages_with_error: 1,
            messages_with_warning: 0,
          ),
        )
      }
    end
  end
end
