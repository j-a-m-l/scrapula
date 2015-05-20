module Scrapula
	class Scraper

	  def initialize
    end

# 		# Returns the title of the page
# 		def title; go('head > title').text end
# 
# 		# Returns the entries of the Meta headers
# 		def meta
# 			results = {}
# 
# 			go 'head > meta' do |metas|
# 				metas.each do |meta|
# 					name = meta.attributes.first[0]
# 
# 					if 'charset' == name
# 						value = meta[name]
# 					else
# 						name = meta[name]
# 						value = meta.attributes['content'].value
# 
# 						if Scrapula.verbose
# 							puts "Unknown meta: #{name}" unless ['http-equiv', 'name', 'property'].include? name
# 						end
# 					end
# 
# 					results[name] = value
# 
# 					# block.call(name, value, meta) if block_given?
# 				end if metas
# 			end
# 
# 			results
# 		end
# 
# 		alias metas meta
# 
# 		# Extract text and href attribute from an anchor
# 		# If you need more attributes, you can use a block
# 		def anchor query, &block
# 			go query do |node|
# 				block_given? ? block.call(node) : [node.text, node.attr('href').text]
# 			end
# 		end
# 
# 		alias link anchor
# 
# 		# Extracts an integer
# 		# The default sanitization can admit integers like 4,123 or 345.678.234 FIXME
# 		# If you need a complex one, you can use a block
# 		def int query, &block
# 			go query do |node|
# 				block_given? ? block.call(node.text) : node.text.slice(/\d+/).to_i
# 			end
# 		end
# 
# 		# TODO Extracts the data of a table and returns it as an array or hash
# 		def table query, &block
# 
# 		end
# 
# 		# Get nodes (Nokogiri::XML::Node)
# 		# It yield the node and an empty hash to the block TODO remove results...
# 		def nodes query, &block
# 			results = []
# 
# 			go query do |nodes|
# 				nodes.each do |node|
# 					result = {}
# 					results << result if yield node, result
# 				end if nodes
# 			end
# 
# 			results
# 		end
# 
# 	private
# 
# 		# Search the page with XPath / CSS query
# 		def go query, &block
# 			page {|p| block_given? ? block.call(p.search query) : p.search(query) }
# 		end

	end
end
