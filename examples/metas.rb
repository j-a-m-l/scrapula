# `metas` == `meta`

Scrapula.get('reddit.com').metas
Scrapula.metas('reddit.com')

Scrapula.get('reddit.com').meta[:description]
Scrapula.get('reddit.com').meta.description

Scrapula.meta('reddit.com')[:description]
Scrapula.meta('reddit.com').description

Scrapula.get('github.com').meta.og
Scrapula.meta('github.com').og

Scrapula.get('github.com').metas.twitter
Scrapula.metas('github.com').twitter
Scrapula.metas('github.com')['twitter:site']

# Query?
Scrapula.metas('github.com')[/twit/]

# Custom ~"namespaces"
Scrapula.metas('page.com').ns

# [] and each methods ?
Scrapula.metas('page.com').each do |meta|
end

# TODO to_a ?
processed_metas = Scrapula.metas('page.com').to_a.map do |meta|
  meta.upcase
end
