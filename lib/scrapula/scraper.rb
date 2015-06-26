require 'forwardable'

module Scrapula
	class Scraper

    extend Forwardable

    # TODO url!
    def_delegator :@page, :at!, :txt!

	  def initialize page, &block
	    @page, @data = page, {}

      instance_eval &block
    end

    def data!
      result = {}
      @data.each_pair do |key, value|
        result[key] = value.is_a?(self.class) ? value.data! : value
      end
      result
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

      # TODO
      def respond_to? name
        true
      end

	end
end
