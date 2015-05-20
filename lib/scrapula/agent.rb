module Scrapula

	# Agent depends on configured agent
	case Scrapula.agent

		when 'Mechanize' then
			require 'mechanize'
			class Agent < Mechanize; end

		# TODO Faraday
		when 'Faraday' then
			require 'faraday'
			class Agent < Faraday; end
			# TODO Typhoeus

		# TODO Curb?

		else raise 'Unknown agent'
	end

end
