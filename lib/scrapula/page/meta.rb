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

      # "name" with content NOTE currently not used
      STANDARD_NAMES = %w[
        application-name
        author
        description
        generator
        keywords
      ]

      # TODO include a list of common headers
      HTTP_HEADERS = %w[
      ]

      def initialize page
        @page = page
        @page_meta = @page.search! 'meta'

        # TODO generate method for each meta
      end

      # TODO?
      # def has? key
      # end

      # TODO?
      # def all
      # end

      def [] key
        case
          when CHARSET == key
            @page.instance_variable_get(:@agent_page).meta_charset.first

          when (PRAGMAS + HTTP_HEADERS).include?(key)
            @page_meta.at("[http-equiv='#{key}']").attr 'content'

          # Open Graph is not standard; uses "property" instead of "name"
          when key[/og:.+/]
            # TODO return more than 1 content for some meta
            @page_meta.at("[property='#{key}']").attr 'content'

          else
            # TODO try http-equiv also
            @page_meta.at("[name='#{key}']").attr 'content'
        end
      rescue NoMethodError
        nil
      end

      private

        def extract_namespaces
        end

    end
  end
end
