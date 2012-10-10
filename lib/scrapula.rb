require 'digest/sha1'
require 'mechanize'

module Scrapula
	VERSION = '0.1.2'

	# TODO verbose

	@@http_methods = ['get', 'post']

	class << self
		define_method(:http_methods) { @@http_methods }
		@@http_methods.each {|http| define_method(http) {|*args| Search.new *[http, *args] } }
	end

	class Search
		attr_reader :url

		def initialize method, url, data=nil, &block
			raise "Invalid http method: #{method}" unless Scrapula.http_methods.include? method

			# Prepend the protocol
			url.sub! /^(?!(?:https?:\/\/))/, 'http://'

			@method, @url, @data, @cache, @agent = method, url, data, {}, Mechanize.new

			yield self if block_given?
		end

		def meta entry, &block

		end

		# Extract text and href from an anchor using a XPath / CSS query
		# If you need more attributes, you can use a block
		def anchor query, &block
			go query do |node|
				block_given? ? block.call(node) : [node.text, node.attr('href').text]
			end
		end

		alias link anchor

		# Extracts an integer using a XPath / CSS query
		# If you need a complex sanization, you can use a block
		def int query, &block
			go query do |node|
				block_given? ? block.call(node.text) : node.text.slice(/\d+/).to_i
			end
		end

		# Extracts nodes using a XPath / CSS query
		def nodes query, &block
			results = []

			go query do |nodes|
				nodes.each do |node|
					result = {}
					results << result if yield node, result
				end if nodes
			end

			results
		end

		private

			# Search the page with XPath / CSS query
			def go query, &block
				request do |agent, page|
					begin
						yield page.search query
					rescue => e
						puts "ERROR: #{e.message}"
						exit 1
					end
				end
			end

			# Sends requests and stores each new different url + data
			def request &block
				key = Digest::SHA1.hexdigest @url + @data.to_s

				@cache[key] = @agent.__send__(@method, @url, @data) unless @cache.include? key

				yield @agent, @cache[key]
			end

	end
end
