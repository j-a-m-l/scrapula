require 'digest/sha1'
require 'mechanize'

# TODO multicurl
# https://github.com/taf2/curb

module Scrapula
	VERSION = '0.1.9'

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

		# Returns the title of the page
		def title; go('head > title').text end

		# Returns the entries of the Meta headers
		def meta
			results = {}

			go 'head > meta' do |metas|
				metas.each do |meta|
					name = meta.attributes.first[0]

					if 'charset' == name
						value = meta[name]
					elsif 'http-equiv' == name || 'name' == name
						name = meta[name]
						value = meta.attributes['content'].value
					else
						raise 'Unknown meta'
					end

					results[name] = value

					# block.call(name, value, meta) if block_given?
				end if metas
			end

			results
		end

		alias metas meta

		# Extract text and href attribute from an anchor
		# If you need more attributes, you can use a block
		def anchor query, &block
			go query do |node|
				block_given? ? block.call(node) : [node.text, node.attr('href').text]
			end
		end

		alias link anchor

		# Extracts an integer
		# The default sanitization can admit integers like 4,123 or 345.678.234 FIXME
		# If you need a complex one, you can use a block
		def int query, &block
			go query do |node|
				block_given? ? block.call(node.text) : node.text.slice(/\d+/).to_i
			end
		end

		# TODO Extracts the data of a table and returns it as an array or hash
		def table query, &block

		end

		# Get nodes (Nokogiri::XML::Node)
		# It yield the node and an empty hash to the block TODO remove results...
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

		# Gets a raw page (Mechanize::Page object)
		def page &block
			request do |agent, page|
				begin
					yield page if block_given?
				rescue => e
					# TODO
					puts "ERROR: #{e.message}"
					exit 1
				end
			end
		end

		private

			# Search the page with XPath / CSS query
			def go query, &block
				page {|p| block_given? ? block.call(p.search query) : p.search(query) }
			end

			# Sends requests and stores each new different url + data
			def request &block
				key = Digest::SHA1.hexdigest @url + @data.to_s

				@cache[key] = @agent.__send__(@method, @url, @data) unless @cache.include? key

				yield @agent, @cache[key]
			end

	end
end
