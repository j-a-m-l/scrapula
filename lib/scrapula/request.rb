module Scrapula
	class Request

		attr_reader :agent, :url, :method, :params

		def initialize(url:, method:, params: [], &block)

		# 	raise "Invalid http method: #{method}" unless Scrapula.http_methods.include? method

			# Prepend the protocol if necessary
			@url = url.sub /\A(?!(?:https?:\/\/))/, 'http://'

      # TODO
      agent = Agent.new

      @agent, @method, @params = agent, method, params

      # TODO
      @headers = {}
      @options = {
        redirects: 0
      }
		end

    def execute
      # TODO other methods
      # TODO other parameters
      Scrapula::Page.new agent.get @url, @params
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
