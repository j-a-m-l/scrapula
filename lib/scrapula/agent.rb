module Scrapula

	# Agent inherits depending on configured agent
	case Scrapula.agent
		when 'Mechanize' then
			require 'mechanize'
			class Agent < Mechanize; end
		# TODO Curl
		# TODO Multi-curl?
		else raise 'Unknown agent'
	end

end
