require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://ruby-doc.org/stdlib-2.4.0/toc.html"))
list = doc.css("a.mature")
items = []
names = []

list.each do |item|
  items += [item['href']]
end

list.each do |item|
  names += [item['href'].split("/").fetch(1)]
end

p pairs = names.zip(items)
