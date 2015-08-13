require 'forwardable'
require_relative '../scrapula'

module S
  class << self
    extend Forwardable
    def_delegators Scrapula, *Scrapula::HTTP_METHODS.map(&:to_sym)
  end
end

def S(*args)
  S.get args
end
