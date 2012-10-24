require 'digest/sha1'

module Scrapula
	class Request
		include Scrapula::Scraper

		attr_reader :url

		def initialize method, url, data=nil, &block
			raise "Invalid http method: #{method}" unless Scrapula.http_methods.include? method

			# Prepend the protocol
			url.sub! /^(?!(?:https?:\/\/))/, 'http://'

			@method, @url, @data, @cache, @agent = method, url, data, {}, Agent.new

			yield self if block_given?
		end

		# Gets a raw page (Mechanize::Page object) TODO other agents...
		def page &block
			request do |agent, page|
				begin
					yield page if block_given?
				rescue => e
					puts "ERROR: #{e.message}" if Scrapula.verbose
					exit 1
				end
			end
		end

		private

			# Sends requests and stores each new different url + data
			def request &block
				key = Digest::SHA1.hexdigest @url + @data.to_s

				@cache[key] = @agent.__send__(@method, @url, @data) unless @cache.include? key

				yield @agent, @cache[key]
			end

	end
end
