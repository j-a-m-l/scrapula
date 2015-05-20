require 'scrapula/version'
require 'scrapula/agent'
require 'scrapula/scraper'
require 'scrapula/request'

module Scrapula

  HTTP_METHODS = %w[get post]

  # # TODO verbose, logger
  # @verbose, @logger, @agent = false, nil, 'Mechanize'

	class << self

    # attr_accessor :verbose, :logger, :default_agent

		HTTP_METHODS.each do |http_method|
		  define_method http_method do |args|
		    request = Request.new args.merge method: http_method
		    # request.execute
        # request.scrape
		    # scraper = Scraper.new
		    # scraper.scrape request.response.body
      end
    end

    # def configure &block
    # end

	end

end
