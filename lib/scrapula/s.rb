require 'forwardable'
require_relative '../scrapula'

module S
  class << self
    extend Forwardable
    def_delegators Scrapula, *Scrapula::HTTP_METHODS.map(&:to_sym)

    alias g get
    # alias p post
    # alias u put
    # alias a patch
    # alias d delete
    # alias h head

  end
end

def S(*args)
  S.get args
end
