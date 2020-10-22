# frozen_string_literal: true

require 'mws/feeds/collection'

module MWS
  module Feeds
    class FeedSubmissionList < Collection
      def each
        xpath('FeedSubmissionInfo').each { |node| yield FeedSubmissionInfo.new(node) }
      end
    end
  end
end
