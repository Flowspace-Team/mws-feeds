# frozen_string_literal: true

require 'mws/feeds/entity'

module MWS
  module Feeds
    class FeedSubmissionCount < Entity
      attribute(:count) do
        integer_at_xpath('Count')
      end
    end
  end
end
