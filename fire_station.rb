require "httparty"

class FireStation
	def initialize
		response = HTTParty.get("https://data.cityofnewyork.us/resource/hc8x-tcnd.json?facilityname=queens") #must be json 
		#in open data nyc, you need SODA api in export option, check the API endpoint to get json link
		#use URI encode to automatically format search: http://ruby-doc.org/stdlib-2.2.1/libdoc/uri/rdoc/URI/Escape.html#method-i-encode
		# x=URI.encode(param), then parse JSON out or else Ruby literally can't even: http://ruby-doc.org/stdlib-2.0.0/libdoc/json/rdoc/JSON.html

       	puts response.body 
   end
end

#()
FireStation.new

#ideas: https://data.cityofnewyork.us/Health/Most-Popular-Baby-Names-by-Sex-and-Mother-s-Ethnic/25th-nujf
#check SODA field names in export button on open data
#look into yelp gem
#https://data.cityofnewyork.us/Health/Health-and-Hospitals-Corporation-HHC-Facilities/f7b6-v6v3 for Health/hospitals
#don't use modules if you can help it. unless you want to improve
#overuse Classes, use as many classes as possible
#To parse a JSON string received by another application or generated within your existing application:

=begin
require 'json'

my_hash = JSON.parse('{"hello": "goodbye"}')
puts my_hash["hello"] => "goodbye"
Notice the extra quotes '' around the hash notation. Ruby expects the argument to be a string and can’t convert objects like a hash or array.

Ruby converts your string into a hash


require "httparty"

class FireStation
	def initialize
		find_station
	end

	def find_station
		puts "What you looking for?"
		fire_station = gets.chomp
		encoded_response = URI.encode(fire_station)
		puts "encoded_response: "
	end
end

FireStation.new
=end