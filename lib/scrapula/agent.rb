require 'mechanize'

# TODO multicurl

module Scrapula
	class Agent

		def initialize
			@agent = Mechanize.new
		end

		def method_missing name, *args
			puts "\n\t > Scrapula::Agent#method_missing: #{name}" if Scrapula.verbose
			@agent.__send__ name.to_sym, *args
		end

	end
end
