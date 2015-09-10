require 'forwardable'

module Scrapula
	class Scraper

    extend Forwardable
    
    # TODO url!
    def_delegators :@page, :search!, :at!, :txt!

	  def initialize page, &block
	    @page, @data = page, {}

      (block.arity == 0 ? instance_eval(&block) : block.call(@page)) if block
    end

    # TODO remove this method
    def data!
      result = {}
      @data.each_pair do |key, value|
        result[key] = value.is_a?(self.class) ? value.data! : value
      end
      result
    end

    def respond_to? name
      true
    end

    private

      def method_missing name, *args, &block

        if args.empty?

          # Used as nested block (TODO it's not compatible with using a query)
          if block_given?
            @data[name] = self.class.new @page, &block

          # Invoked as an attribute
          elsif @data.has_key? name
            return @data[name]

          else
            raise 'Unknown case!'
          end

        else

          @data[name] = @page.txt! *args
        end

      end

	end
end
