#When you HTTParty, you must party hard!
#api gives you back data the way that you ask for
#example: {"cnt"=>"10", "brth_yr"=>"2011", "gndr"=>"FEMALE", "rnk"=>"45", "nm"=>"ZANIYAH", "ethcty"=>"BLACK NON HISPANIC"}
#if rank_picks == 4
    
#      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json")
#      parsed_response = JSON.parse(response.body)
#      result = parsed_response
      
#      puts result
=begin (this the example of how you can print all the names from data set. potenatially you could do this for any of the single column)
 --------
 z=0
    while z >= 0  do
      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json")
      parsed_response = JSON.parse(response.body)
      result = parsed_response[z]
      puts "#{result["nm"]}"
      z+=1
    end
         end
---------

  while z >= 0  do
      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?gndr=FEMALE") #prints list from girls from middle of hispanic onward then back to top of list
      parsed_response = JSON.parse(response.body)
      result = parsed_response[z]
      puts "#{result["nm"]}"
      z+=1
      #count-=1
   end
         end
---------------
#this prints out a list of all the female asian and black non-hispanic names
  def name_lookup #just to convert if you have spaces and such
  # response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?nm=#{encoded_response}")
    response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json")
   parsed_response = JSON.parse(response.body) #this supposed turned the data into a ruby hash that i can iterate over
  x = parsed_response.map { |entry| entry["ethcty"]}
  print x
  end
  __________
def g_rank # sorts entire ist of female names alphabetically
    response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?gndr=female")
    parsed_response = JSON.parse(response.body) #this supposed turned the data into a ruby hash that i can iterate over
    y = parsed_response.map { |entry| entry["nm"] }
    puts y.sort
  end

=end
require 'httparty'


class Name_gen
  attr_accessor :count
  def initialize
    ask_user
    @count = count
  end
    
  def ask_user
    puts "Here are the options:
      Enter [1] for: Top 5 baby names in NYC
      Enter [2] for: Check to see if name has made the list of most popular names!
      Enter [3] for: Create your own baby name.
      Enter [4] for: An inspirational quote before you leave."
    user_choice = gets.chomp.to_i
    name_bot(user_choice)
    ask_user unless user_choice == 4
    end
  end

  def name_bot(user_choice)
    if user_choice == 1
      name_rank
    end

    if user_choice == 2
      name_lookup
    end

    if user_choice == 3
      name_mixer
    end

    if user_choice == 4
      inspira_quote
    end

  end

  def name_rank
    puts "How do you want the top baby names listed by?
      Enter [1] for: Boy names
      Enter [2] for: Girl names
      Enter [3] for: Ethnicity
      Enter [4] for: Top 5 (doesn't matter if boy or girl)" #add features
      print "\n"
    rank_picks = gets.chomp.to_i
    if rank_picks == 1
    end
    if rank_picks == 2
    end
    if rank_picks == 3
    end
    if rank_picks == 4
    z=0
   # count = 5
    while z >= 0  do
      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?gndr=FEMALE")
      parsed_response = JSON.parse(response.body)
      result = parsed_response[z]
      (result["nm"]).sort
      z+=1
      #count-=1
   end
         end
end
  def name_lookup #just to convert if you have spaces and such
  # response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?nm=#{encoded_response}")
    response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?gndr=male")
   parsed_response = JSON.parse(response.body) #this supposed turned the data into a ruby hash that i can iterate over
  x = parsed_response.map { |entry| entry["nm"]}
  print x
  end
    
    #puts "#{result["nm"].capitalize} is ranked #{result["rnk"]}." 




Name_gen.new