# `metas` == `meta`

Scrapula.get('reddit.com').metas
Scrapula.metas('reddit.com')

Scrapula.get('reddit.com').meta[:description]
Scrapula.meta('reddit.com')[:description]

Scrapula.get('github.com').meta.og
Scrapula.meta('github.com').og

Scrapula.get('github.com').metas.twitter
Scrapula.metas('github.com').twitter

# Custom namespaces
Scrapula.metas('page.com').customns
