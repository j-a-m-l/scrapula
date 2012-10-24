module Scrapula

	# TODO verbose, logger
	@verbose, @logger, @agent = false, nil, 'Mechanize'

	@@http_methods = ['get', 'post']

	class << self; attr_accessor :verbose, :logger, :agent end
end

require 'scrapula/version'
require 'scrapula/agent'
require 'scrapula/scraper'
require 'scrapula/request'

module Scrapula

	class << self
		define_method(:http_methods) { @@http_methods }
		@@http_methods.each {|http| define_method(http) {|*args| Request.new *[http, *args] } }
	end

end
