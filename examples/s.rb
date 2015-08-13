require_relative '../lib/scrapula/s'


lol_node = S('lol.com').at!('#lol')

lol_content = S('lol.com').text!('#lol')

array_of_content = S('lol.com').text!({ lol: '#lol', xd: '#xD' })

S 'http://google.com' do |page|
  # result page.('example')
end

S 'http://google.com' do
  # result 'example'
end

S.get 'http://google.com' do
  # result 'example'
end

S.post 'http://google.com' do
  # result 'example'
end
