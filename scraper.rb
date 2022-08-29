# Part I: Static Pages
# ====================
require 'open-uri'
require 'net/http'
require 'json'
require 'HTTParty'
require 'nokogiri'
require 'awesome_print'
require 'csv'

# url = 'https://en.wikipedia.org/wiki/Grigori_Perelman'
# url = 'https://data.cityofnewyork.us/resource/uvks-tn5n.json'
url = 'https://en.wikipedia.org/wiki/Douglas_Adams'

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

#parsing HTML into a DOM tree with Nokogiri
#==========================================
doc = Nokogiri::HTML(html)
# puts doc
description = doc.css("p").text.split("\n").find { |s| s.length > 0 } #first non-empty paragraph
# description = doc.css("p")[1].children[1]
# description = doc.css('img')[0]
# description = doc.css('.infobox-image img')
picture = doc.css("td a img").find{|picture| picture.attributes["alt"].value.include?("Douglas adams portrait cropped.jpg")}.attributes["src"].value

# puts description
# puts picture

# Exporting scraped data to CSV
# =============================

data_arr = []
data_arr.push(description, picture)

CSV.open('data.csv', 'w') { |csv| csv << data_arr} #write data to CSV file


