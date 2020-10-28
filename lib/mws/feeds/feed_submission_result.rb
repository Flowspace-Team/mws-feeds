# frozen_string_literal: true

require 'mws/feeds/entity'
require 'mws/feeds/processing_summary'
require 'mws/feeds/result_list'

module MWS
  module Feeds
    class FeedSubmissionResult < Entity
      def processing_summary
        ProcessingSummary.new(xpath('ProcessingSummary').first, namespace: namespace)
      end

      def results
        ResultList.new(node, namespace: namespace)
      end
    end
  end
end
