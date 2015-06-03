require_relative '../lib/scrapula'

page = Scrapula.get 'reddit.com'

hs1 = page.scrape do
  h1 'h1'
  h2 'h2'
  h3 'h3'
  h4 'h4'
  h5 'h5'
end

# Alternative way
hs2 = page.scrape
  # TODO
  txt!({ h1: 'h1', h2: 'h2', h3: 'h3', h4: 'h4', h5: 'h5' })
end

puts hs1
puts hs2
