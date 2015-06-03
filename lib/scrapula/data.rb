module Scrapula
  class Data < BasicObject

    def initialize
      @data = {}

      # undef_method :execute
    end

    def execute &block

      yield @page

      # block.call
    end

  end
end
