require_relative './scrapula/version'
require_relative './scrapula/agent'
require_relative './scrapula/scraper'
require_relative './scrapula/request'
require_relative './scrapula/page'
require_relative './scrapula/data'

module Scrapula

  # TODO benchmark
  # AGENTS = %w[mechanize]

  # TODO
  HTTP_METHODS = %w[get]

  # # TODO verbose, logger
  # @verbose, @logger, @agent = false, nil, 'Mechanize'

	class << self

    # attr_accessor :verbose, :logger, :default_agent

		HTTP_METHODS.each do |http_method|
		  define_method http_method do |*args, &block|

		    # Prepare the request data
        data = args[0].is_a?(Hash) ? args[0] : { url: args[0], params: args[1] }
        data.merge! method: http_method

		    page = Request.new(data).execute

        block ? page.scrape(&block) : page
      end
    end

    def meta url
      get(url).meta!
    end
    alias metas meta

    # def configure &block
    # end

	end

end
