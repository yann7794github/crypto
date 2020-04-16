require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'


PAGE_URL = "https://coinmarketcap.com/all/views/all/"

page = Nokogiri::HTML(open(PAGE_URL))

currency_name_array = page.xpath("//tr/td/a[contains(@class, 'currency-name-container')]/text()").map {|x| x.to_s }
currency_value_array = page.xpath("//tr/td/a[contains(@class, 'price')]/text()").map {|x| x.to_s }

currency_result = Hash[currency_name_array.zip(currency_value_array)]

puts currency_result
