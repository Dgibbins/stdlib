require 'nokogiri'
require 'open-uri'

stdlib_url = "http://ruby-doc.org/stdlib-2.4.0/"
stdlib_doc = Nokogiri::HTML(open("http://ruby-doc.org/stdlib-2.4.0/toc.html"))
list = stdlib_doc.css("a.mature")
items = []
names = []

list.each do |item|
  items += [item['href']]
end

list.each do |item|
  names += [item['href'].split("/").fetch(1)]
end

pairs = names.zip(items)

pairs.each do |pair|

  @url = stdlib_url + 'libdoc/' + pairs[0][0].to_s + '/rdoc/index.html'
  @doc = Nokogiri::HTML(open(@url))
  @link = stdlib_url + 'libdoc/' + pairs[0][0].to_s + '/rdoc/' + @doc.css("div#class-index a").first['href']
  @doc_page = Nokogiri::HTML(open(@link))
  @summary = @doc_page.css('#description p').first.text

end


# doc_url = stdlib_url + 'libdoc/' + pairs[0][0].to_s + '/rdoc/index.html'
#
# abbrev_doc = Nokogiri::HTML(open(doc_url))
#
# abbrev_doc.css("div#class-index a").first['href']
