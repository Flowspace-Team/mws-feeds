# frozen_string_literal: true

require 'mws/feeds/entity'

module MWS
  module Feeds
    class ProcessingSummary < Entity
      attribute(:messages_processed) do
        integer_at_xpath('MessagesProcessed')
      end

      attribute(:messages_successful) do
        integer_at_xpath('MessagesSuccessful')
      end

      attribute(:messages_with_error) do
        integer_at_xpath('MessagesWithError')
      end

      attribute(:messages_with_warning) do
        integer_at_xpath('MessagesWithWarning')
      end
    end
  end
end
