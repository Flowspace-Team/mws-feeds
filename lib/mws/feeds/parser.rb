# frozen_string_literal: true

require 'peddler'
require 'nokogiri'
require 'mws/feeds/feed_submission_count'
require 'mws/feeds/feed_submission_info'
require 'mws/feeds/feed_submission_list'

module MWS
  module Feeds
    class Parser
      include ::Peddler::Headers

      def initialize(response, _encoding)
        @response = response
      end

      def parse
        node = find_result_node

        case node.name
        when /GetFeedSubmissionCount/
          FeedSubmissionCount.new(node)
        when /SubmitFeedResult/
          FeedSubmissionInfo.new(node.at('FeedSubmissionInfo'))
        when /GetFeedSubmissionListResult/
          FeedSubmissionList.new(node)
        else
          raise NotImplementedError, node.name
        end
      end

      def headers
        @response.headers
      end

      def status_code
        @response.status
      end

      def body
        @response.body
      end

      private

      def find_result_node
        xml = Nokogiri(@response.body)
        root = xml.children.first

        root.children.find { |node| node.name.include?('Result') }
      end
    end

    # Override Peddler's default Parser.
    Client.parser = Parser
  end
end
