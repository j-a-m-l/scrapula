[![Build Status](TODO)

Scrapula
========
Scrapula is the licentious scraping library.

Requirements
============
It uses [Mechanize](http://mechanize.rubyforge.org/) and [Nokogiri](http://nokogiri.org) to obtain and extract the information and [RSpec](https://www.relishapp.com/rspec) for testing.

Configuration
=============
If you want to show the output of some steps:

```ruby
Scrapula.verbose = true
```

API
===

Perform requests:

```ruby
page = Scrapula.get 'example.net' #=> Scrapula::Page object

page = Scrapula.post 'example.net', { q: 'a query' }   #=> Scrapula::Page object
```

Extract information from the page:

```ruby
# Using a CSS selector (all elements)
page.search! 'a'

# Using a CSS selector (fist element)
page.at! 'h1'

# Using XPath (fist element)
page.at! '//'
```

Perform a GET request:

```ruby
Scrapula.get 'example.net
```

S interface
-----------
This API is not required by default, so it is up to you to use it:
```ruby
require 'scrapula/s'
```

It provides the method and its shortcut For all HTTP verbs:

```ruby
S.get 'example.net'
S.g 'example.net'

S.post 'example.net'
S.p 'example.net'

S.put 'example.net'
S.u 'example.net'

S.patch 'example.net'
S.a 'example.net'

S.delete 'example.net'
S.d 'example.net'

S.head 'example.net'
S.h 'example.net'
```

Additionally, GET requests, can be performed with through the shortest invocation:

```ruby
S 'example.net'
```

Examples
--------

There are more examples in the `examples` folder.

Changelog
=========

You can read previous changes in `CHANGELOG.md`

Contributing
============

Authors
=======
Juan A. Martín Lucas (https://github.com/j-a-m-l)

License
=======
This project is licensed under the MIT license. See [LICENSE]() for details.
