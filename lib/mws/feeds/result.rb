# frozen_string_literal: true

require 'mws/feeds/entity'

module MWS
  module Feeds
    class Result < Entity
      attribute(:message_id) do
        integer_at_xpath('MessageID')
      end

      attribute(:result_code) do
        text_at_xpath('ResultCode')
      end

      attribute(:result_message_code) do
        integer_at_xpath('ResultMessageCode')
      end

      attribute(:result_description) do
        text_at_xpath('ResultDescription')
      end
    end
  end
end
