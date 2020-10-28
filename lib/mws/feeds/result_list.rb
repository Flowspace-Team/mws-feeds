# frozen_string_literal: true

require 'mws/feeds/collection'
require 'mws/feeds/result'

module MWS
  module Feeds
    class ResultList < Collection
      def each
        xpath('Result').each { |node| yield Result.new(node, namespace: namespace) }
      end
    end
  end
end
