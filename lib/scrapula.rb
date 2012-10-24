require 'scrapula/version'
require 'scrapula/agent'
require 'scrapula/scraper'
require 'scrapula/request'

module Scrapula

	# TODO verbose, logger
	@verbose, @logger = false, nil

	@@http_methods = ['get', 'post']

	class << self
		attr_accessor :verbose, :logger

		define_method(:http_methods) { @@http_methods }
		@@http_methods.each {|http| define_method(http) {|*args| Request.new *[http, *args] } }
	end

end
