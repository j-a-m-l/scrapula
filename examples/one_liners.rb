require_relative '../lib/scrapula'

lol_node = Scrapula.get('lol.com').at!('#lol')

# It is possible to use the methods without "!"; in block syntax it's not
lol_node = Scrapula.get('lol.com').at('#lol')
lol_results = Scrapula.get('lol.com') do
  at! '#lol'
end
