# require 'digest/sha1'
#
module Scrapula
	class Request
# 		include Scrapula::Scraper

		attr_reader :url, :method, :params

		def initialize(url:, method:, params: {}, &block)

		# 	raise "Invalid http method: #{method}" unless Scrapula.http_methods.include? method

		# 	# Prepend the protocol
		# 	url.sub! /^(?!(?:https?:\/\/))/, 'http://'

    @url, @method, @params = url, method, params

		# 	@method, @url, @data, @cache, @agent = method, url, data, {}, Agent.new

		# 	yield self if block_given?
		end

    def execute agent
      agent.__send__ @method, @url, @params
    end

    def scrape
    end

# 		# Gets a raw page (Mechanize::Page object) TODO other agents...
# 		def page &block
# 			request do |agent, page|
# 				begin
# 					yield page if block_given?
# 				rescue => e
# 					puts "ERROR: #{e.message}" if Scrapula.verbose
# 					exit 1
# 				end
# 			end
# 		end

	end
end
