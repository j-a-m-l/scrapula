require_relative '../scrapula'

S = ->(url, queries: nil, &block) {
  page = Scrapula.get url: url

  putter = ->(query) {
    puts query
  }

  # TODO Scrapula::S
  class Bla < BasicObject
    def method_missing name, *args, &block
      ::Kernel.puts name, args
    end
  end

  if block
    # block.arity == 0 ? putter.instance_eval(&block) : block.call(putter)
    block.arity == 0 ? Bla.new.instance_eval(&block) : block.call(putter)
  end

  putter
}

# TODO return a class
# def S()
# end
