# frozen_string_literal: true

require 'peddler'
require 'nokogiri'
require 'mws/feeds/feed_submission_count'
require 'mws/feeds/feed_submission_info'
require 'mws/feeds/feed_submission_list'
require 'mws/feeds/feed_submission_result'

module MWS
  module Feeds
    class Parser
      include ::Peddler::Headers

      def initialize(response, _encoding)
        @response = response
      end

      def parse
        node = find_payload

        case node.name
        when /GetFeedSubmissionCount/
          FeedSubmissionCount.new(node)
        when /SubmitFeedResult/
          FeedSubmissionInfo.new(node.at('FeedSubmissionInfo'))
        when /GetFeedSubmissionListResult/
          FeedSubmissionList.new(node)
        when 'ProcessingReport'
          FeedSubmissionResult.new(node, namespace: nil)
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

      def find_payload
        xml = Nokogiri(@response.body)
        find_result_node(xml) || find_processing_report_node(xml)
      end

      def find_result_node(xml)
        root = xml.children.first
        root.children.find { |node| node.name.include?('Result') }
      end

      def find_processing_report_node(xml)
        xml.xpath('//ProcessingReport').first
      end
    end

    # Override Peddler's default Parser.
    Client.parser = Parser
  end
end
