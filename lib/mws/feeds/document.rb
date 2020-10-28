# frozen_string_literal: true

module MWS
  module Feeds
    class Document
      attr_reader :node
      attr_reader :namespace

      def initialize(node, namespace: 'xmlns')
        @node = node
        @namespace = namespace
      end

      def xpath(path)
        node.xpath(add_namespace(path))
      end

      private

      def add_namespace(path)
        return path if namespace.nil?

        path.
          split('/').
          map { |attr| "xmlns:#{attr}" }.
          join('/')
      end
    end
  end
end
