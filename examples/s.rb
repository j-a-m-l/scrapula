require_relative '../lib/scrapula/s'


lol_node = S.('lol.com').at!('#lol')

lol_content = S.('lol.com').text!('#lol')

array_of_content = S.('lol.com').text!({ lol: '#lol', xd: '#xD' })

# page = S.('http://google.com')
# puts page.('lol')

# puts S.('http://google.com').('example')

S.('http://google.com') do |page|
  # result page.('example')
end

S.('http://google.com') do
  # result 'example'
end
