require_relative '../lib/scrapula'

page = Scrapula.get 'reddit.com'
h1 = page.at! 'h1'

puts h1
