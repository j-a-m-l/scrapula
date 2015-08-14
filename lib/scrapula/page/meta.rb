module Scrapula
  class Page
    # http://www.w3.org/TR/html5/document-metadata.html#the-meta-element
    #
    # TODO lang?
    class Meta

      # Only 1 charset, without content
      CHARSET = 'charset'

      # "http-equiv" with content
      PRAGMAS = %w[
        content-type
        default-style
        refresh
      ]

      # "name" with content
      STANDARD_NAMES = %w[
        application-name
        author
        description
        generator
        keywords
      ]

      def initialize page
        @page = page
        @page_meta = @page.search! 'meta'

        # TODO generate method for each meta
      end

      def [] key
        case
          when CHARSET == key
            @page.instance_variable_get(:@agent_page).meta_charset.first

          when PRAGMAS.include?(key)
            @page_meta.at("[http-equiv='#{key}']").attr 'content'

          when STANDARD_NAMES.include?(key)
            @page_meta.at("[name='#{key}']").attr 'content'

          # Open Graph is not standard; uses "property" instead of "name"
          when key[/og:.+/]
            # TODO return more than 1 content for some meta
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
