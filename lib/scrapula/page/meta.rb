require 'forwardable'

module Scrapula
  class Page
    # http://www.w3.org/TR/html5/document-metadata.html#the-meta-element
    # Only 1 charset, without content
    # name or http-equiv, with content
    # property is not standard, although used by Open Graph
    #
    # TODO lang?
    class Meta
      extend Forwardable

      CHARSET = 'charset'

      PRAGMAS = %w[
        content-type
        default-style
        refresh
      ]

      STANDARD_NAMES = %w[
        application-name
        author
        description
        generator
        keywords
      ]

      def_delegators :@page_meta, :[]

      def initialize page
        @page = page
        @page_meta = @page.search! 'meta'

        # TODO generate method for each meta
      end

      def [] key
        case
          when CHARSET == key
            @page.meta_charset

          when PRAGMAS.include?(key)
            @page_meta.at("[http-equiv='#{key}']").attr 'content'

          when STANDARD_NAMES.include?(key)
            @page_meta.at("[name='#{key}']").attr 'content'

          # Open Graph is not standard; uses "property" instead of "name"
          # TODO return more than 1 content for some meta
          when key[/og:.+/]
            @page_meta.at("[property='#{key}']").attr 'content'

          # TODO is an HTTP header
          # when key
          #   @page_meta.at("[http-equiv='#{key}']").attr 'content'

          else
            @page_meta.at("[name='#{key}']").attr 'content'
        end

      # TODO
      rescue NoMethodError
        raise 'Unknown meta'
      end

      private

        def extract_namespaces
        end

    end
  end
end
