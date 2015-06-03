require_relative '../lib/scrapula'

posts = Scrapula.get 'reddit.com' do
  # TODO relative
  posts '.posts' do
    title '.title'

    comments '.comment' do
      author '.author'
    end
  end
end

puts posts
