require_relative '../lib/scrapula'

query = 'ruby scraping'
page = Scrapula.get 'stackoverflow.com/search', q: query

# Extract the number of results (with newline characters and spaces)
number_of_results = page.text! '.results-header h2'

# Apply the operation (method) strip to the result
first_result = page.txt! '.search-result[data-position="1"] .result-link', [:strip]

puts "Stack Overflow returns #{number_of_results.strip} for \"#{query}\""
puts "Stack Overflow returns \"#{first_result}\" as first result for \"#{query}\""
