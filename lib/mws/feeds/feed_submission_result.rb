# frozen_string_literal: true

require 'mws/feeds/entity'
require 'mws/feeds/processing_summary'
require 'mws/feeds/result_list'

module MWS
  module Feeds
    class FeedSubmissionResult < Entity
      attribute(:document_transaction_id) do
        integer_at_xpath('DocumentTransactionID')
      end

      attribute(:status_code) do
        text_at_xpath('StatusCode')
      end

      def processing_summary
        ProcessingSummary.new(xpath('ProcessingSummary').first, namespace: namespace)
      end

      def results
        ResultList.new(node, namespace: namespace)
      end
    end
  end
end
