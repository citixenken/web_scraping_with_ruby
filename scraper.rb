require 'open-uri'
require 'net/http'
require 'json'
require 'HTTParty'
require 'nokogiri'
require 'awesome_print'

url = 'https://en.wikipedia.org/wiki/Grigori_Perelman'
# url = 'https://data.cityofnewyork.us/resource/uvks-tn5n.json'

# using net/http
# ==============
# uri = URI.parse(url)

# res = Net::HTTP.get_response(uri)
# html = res.body
# puts html

# result = JSON.parse(html)
# puts result

# using httparty
# ==============
# res = HTTParty.get(url)
# # puts res.class #HTTParty::Response
# html = res.body
# puts html

# puts html.class #String 

# using open-uri
# ==============
html = URI.open(url) #File descriptor => allows us to read from URL as if it were a file, line by line
# puts html 

#parsing HTML with Nokogiri
#==========================
doc = Nokogiri::HTML(html)
# puts doc
# description = doc.css("p").text.split("\n").find { |s| s.length > 0 } #first non-empty paragraph
# description = doc.css("p")[1].children[1]
# description = doc.css('img')[0]
description = doc.css('.infobox-image img')

puts description