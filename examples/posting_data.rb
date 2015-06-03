require_relative '../lib/scrapula'

# TODO
page = Scrapula.post 'duckduckgo.com', {}
h1 = page.at! 'h1'

puts h1
