require_relative '../lib/scrapula'

Scrapula.get "http://example.com/?q=#{params}" do
  number css: '#container ul > active.li' do |node, resource|
    node[/([\d,]+)\s*results?/i, 1].gsub(',', '').to_i
  end
end

Scrapula.get "http://example.com/?q=#{params}" do
  number css: '#container ul > active.li' do |node, resource|
    node[/([\d,]+)\s*results?/i, 1].gsub(',', '').to_i
  end

  number = css '#container ul > active.li' do |node, resource|
    node[/([\d,]+)\s*results?/i, 1].gsub(',', '').to_i
  end

  number = css '#container .number', [:to_s, :strip, :to_i]

  number css! '#container .number', [:to_s, :strip, :to_i]
  number xpath! '//a', [:to_s, :strip, :to_i]

  number { css: '#container .number' }, [:to_s, :strip, :to_i]
  number { xpath: '//a' }, [:to_s, :strip, :to_i]

  # Infer query type
  number '#container .number', [:to_s, :strip, :to_i]

  number do
    validates!({
      presence: true,
      numerically: true,
    })

    rescue! do |error|
      puts 'Error on number'
    end
  end

end
