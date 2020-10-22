# frozen_string_literal: true

require 'pry'
require 'spec_helper'

RSpec.describe MWS::Feeds::FeedSubmissionList do
  let(:instance) { described_class.new(node) }
  let(:node) { load_xml_fixture('get_feed_submission_list').xpath('//xmlns:GetFeedSubmissionListResult').first }

  subject { instance }

  it { is_expected.to all be_a(MWS::Feeds::FeedSubmissionInfo) }
end
