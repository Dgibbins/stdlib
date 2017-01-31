require 'nokogiri'
require 'open-uri'
require 'pry'

stdlib_url = 'http://ruby-doc.org/stdlib-2.4.0/'
stdlib_doc = Nokogiri::HTML(open('http://ruby-doc.org/stdlib-2.4.0/toc.html'))
list = stdlib_doc.css('a.mature')
items = []
names = []

list.each do |item|
    items += [item['href']]
end

list.each do |item|
    names += [item['href'].split('/').fetch(1)]
end

pairs = names.zip(items)
# new_pairs = pairs[28..101]
summaries = []

i = 0
while i <= pairs.length
    pairs.each do |pair|
        pairs[0][0] = 'io/nonblock/' if pairs[0][0] == "io"
        doc = Nokogiri::HTML(open(url))
        link = stdlib_url + 'libdoc/' + pairs[0][0].to_s + 'rdoc/' + doc.css('div#class-index a').first['href']
        doc_page = Nokogiri::HTML(open(link))

        puts i
        if doc_page.css('#description p').empty?
          summaries += ['No description provided']
        else
          summaries += [doc_page.css('#description p').first.text]
        end
        i += 1
    end
end



http://ruby-doc.org/stdlib-2.4.0/libdoc/getoptlong/rdoc/index.html
http://ruby-doc.org/stdlib-2.4.0/libdoc/io/nonblock/rdoc/index.html
