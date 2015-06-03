require_relative '../lib/scrapula'

request = Scrapula::Request.new url: 'http://gitlab.com', method: :get
page = request.execute

page_content = Scrapula::Scraper.new page do
  lol '#lol'
  more '#more'
  examples '.examples'
end

# This is the equivalent to the previous code
page_content = page.scrape do
  lol '#lol'
  more '#more'
  examples '.examples'
end
