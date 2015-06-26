module Scrapula
  class Page

    def initialize agent_page
      @agent_page = agent_page
    end

    # TODO
    # def url!
    #   @agent_page.url
    # end

    def scrape &block
      scraper = Scrapula::Scraper.new self, &block
      scraper.instance_variable_get :@data
    end

    # at returns the first one only, but search returns all
    def search! query, operations = [], &block
      result = @agent_page.search query

      # TODO more results
      result = operations.reduce(result) do |tmp, op|
        tmp.__send__ op
      end if result

      yield result if block_given?

      result
    end

    # at returns the first one only, but search returns all
    # TODO merge with search!
    def at! query, operations = [], &block
      result = @agent_page.at query
      result = operations.reduce(result) {|tmp, op| tmp.__send__ op } if result

      yield result if block_given?

      result
    end

    # TODO
    # def attribute! query, name, operations = [], &block
    # end

    def html! query, operations = [], &block
      operations.unshift :to_html
      at! query, operations, &block
    end

    def text! query, operations = [], &block
      operations.unshift :text
      at! query, operations, &block
    end
    alias txt! text!

    # TODO xhtml! (to_xhtml) ?
    # TODO inner_html / inner_text ?

    def regex! query, re, operations = [], &block
    end
    alias re! regex!

    def int! query, re, operations = [], &block
    end

    def decimal! query, operations = [], &block
    end

    def datetime! query, format, operations = [], &block
    end

    def date! query, format, operations = [], &block
    end

    def time! query, format, operations = [], &block
    end

    # def css! query, operations = [], &block
    #   @agent_page.css query
    # end

    # def xpath! query, operations = [], &block
    # end

    # TODO
    # def validates! 
    # end

    # TODO?
    # def rescue! error, &block
    # end

    # TODO title, meta/s, anchors/links, table
  end

  # Class.new {
  #   def regex node_set, regex
  #     node_set.find_all { |node| node['some_attribute'] =~ /#{regex}/ }
  #   end
  # }.new

end
