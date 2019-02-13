# frozen_string_literal: true

require 'spec_helper'

RSpec.describe MWS::Feeds::FeedSubmissionCount do
  let(:instance) { described_class.new(node) }
  let(:node) { load_xml_fixture('feed_submission_count').xpath('//xmlns:GetFeedSubmissionCountResult').first }

  describe '#count' do
    subject { instance.count }

    it { is_expected.to be_a(Integer) }
    it { is_expected.to eq(0) }
  end
end
