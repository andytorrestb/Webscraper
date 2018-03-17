=begin 
Date: 3/16/2018
Author: Andy Torres

Used: http://ruby.bastardsbook.com/chapters/html-parsing/

as a reference frequently 

=end

require 'HTTParty'
require 'Nokogiri'
require 'Pry'
require 'csv'
require 'rubygems'

# requesting page to scrape

page = HTTParty.get('https://princefurnishings.com/collections/accessories')

# this turn the page into a nokogiri object, makingit easy to parse. 
parse_page = Nokogiri::HTML(page)

# this is an empty array where we will store all the data on our products
titles_array = [20]
prices_array = [20]

=begin 

This assigns the values for the titles and prices into seperate 1D arrays 
and then prints out that array. 

=end 
i = 0
while i < 8
	
	titles = parse_page.css('.grid-view-item__title')[i].text 
	titles_array[i]= titles 

	prices = parse_page.css('.grid-view-item__link').css('span.product-price__price')[i].text    
	prices_array[i] = prices

	i = i + 1
end

puts titles_array
puts prices_array


