# frozen_string_literal: true

require 'mws/feeds/entity'

module MWS
  module Feeds
    class FeedSubmissionInfo < Entity
      attribute(:feed_submission_id) do
        text_at_xpath('FeedSubmissionId')
      end

      attribute(:feed_type) do
        text_at_xpath('FeedType')
      end

      attribute(:status) do
        text_at_xpath('FeedProcessingStatus')
      end

      attribute(:submitted_at) do
        time_at_xpath('SubmittedDate')
      end

      attribute(:started_processing_at) do
        time_at_xpath('StartedProcessingDate')
      end

      attribute(:completed_processing_at) do
        time_at_xpath('CompletedProcessingDate')
      end
    end
  end
end
