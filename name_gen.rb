require 'httparty'

class Name_gen
  attr_accessor :count
  def initialize
    print "\n"
    puts "-----------------------------------------------------------"
    puts "Pull information from NYC's dataset of popular baby names!"
    puts "-----------------------------------------------------------"
    ask_user
  end
    
  def ask_user
    print "\n"
    puts "Here's the menu of options:
    Enter [1] for: Top baby names in NYC
    Enter [2] for: Check to see if a name has made it to the list of most popular names! 
    Enter [3] for: Create your own baby name
    Enter [4] for: An ~inspirational~ quote before you leave"
    user_choice = gets.chomp.to_i
    name_bot(user_choice)
    ask_user unless user_choice == 4
  end

  def name_bot(user_choice)
    case user_choice
      when 1
        name_rank
      when 2
        name_lookup
      when 3
        name_mixer
      when 4
        inspira_quote
    end
  end

  def name_rank
    print "\n"
    puts "How do you want the top baby names listed by?
      Enter [1] for: Boy names
      Enter [2] for: Girl names
      Enter [3] for: Ethnicity
      Enter [4] for: Top Ranking names (regardless of gender or ethnicity)
      Enter [5] for menu"
    print "\n"

    rank_picks = gets.chomp.to_i
      case rank_picks
        when 1
          b_rank
        when 2
          g_rank
        when 3
          ethcty_rank
        when 4
          number_one
        when 5
          ask_user
      end
  end

  def b_rank
    response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?gndr=MALE")
    parsed_response = JSON.parse(response.body)
    result = parsed_response.sort_by! { |entry| entry["rnk"]}
    print "\n"
    puts "Here's the list (top of the list starts from most popular):"
    puts "-----------------------------------------------------------------"
    names = result.map { |entry| (entry["nm"].capitalize) }
    u = names.uniq
    puts u
    puts "-----------------------------------------------------------------"
  end

  def g_rank 
    response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?gndr=FEMALE")
    parsed_response = JSON.parse(response.body)
    result = parsed_response.sort_by! { |entry| entry["rnk"]}
    print "\n"
    puts "Here's the list (top of the list starts from most popular):"
    puts "-----------------------------------------------------------------"
    names = result.map { |entry| (entry["nm"].capitalize) }
    u = names.uniq
    puts u
    puts "-----------------------------------------------------------------"
  end
 
  def ethcty_rank
    print "\n"
    puts "Choose one of the following options:
      Enter [A] for Asian and Pacific Islander
      Enter [B] for Black Non Hispanic
      Enter [C] for Hispanic
      Enter [D] for White Non Hispanic"
  
    eth_choice = gets.chomp.downcase
    print "\n"
      case eth_choice
        when "a"
          response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?ethcty=ASIAN%20AND%20PACIFIC%20ISLANDER")
          parsed_response = JSON.parse(response.body)
          result = parsed_response.sort_by! { |entry| entry["rnk"]}
          print "\n"
          puts "Here's the list (top of the list starts from most popular):"
          puts "-----------------------------------------------------------------"
          names = result.map { |entry| (entry["nm"].capitalize) }
          u = names.uniq
          puts u
          puts "-----------------------------------------------------------------"
        when "b"
          response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?ethcty=BLACK%20NON%20HISPANIC")
          parsed_response = JSON.parse(response.body)
          result = parsed_response.sort_by! { |entry| entry["rnk"]}
          print "\n"
          puts "Here's the list (top of the list starts from most popular):"
          puts "-----------------------------------------------------------------"
          names = result.map { |entry| (entry["nm"].capitalize) }
          u = names.uniq
          puts u
          puts "-----------------------------------------------------------------"
        when "c"
          response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?ethcty=HISPANIC")
          parsed_response = JSON.parse(response.body)
          result = parsed_response.sort_by! { |entry| entry["rnk"]}
          print "\n" 
          puts "Here's the list (top of the list starts from most popular):"
          puts "-----------------------------------------------------------------"
          names = result.map { |entry| (entry["nm"].capitalize) }
          u = names.uniq
          puts u
          puts "-----------------------------------------------------------------"
        when "d"
          response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?ethcty=WHITE%20NON%20HISPANIC")
          parsed_response = JSON.parse(response.body)
          result = parsed_response.sort_by! { |entry| entry["rnk"]}
          print "\n"
          puts "Here's the list (top of the list starts from most popular):"
          puts "-----------------------------------------------------------------"
          names = result.map { |entry| (entry["nm"].capitalize) }
          u = names.uniq
          puts u
          puts "-----------------------------------------------------------------"
      end
  end

  def number_one
    print "\n"
    rank_number = 1
      while rank_number < 6 do
        print "\n"
        puts "These names are ranked ##{rank_number} in New York City:"    
        response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?RNK=#{rank_number}")
        parsed_response = JSON.parse(response.body)
        x = parsed_response.map { |entry| entry["nm"].capitalize }   
        u = x.uniq
        puts u
        rank_number += 1
      end
  end

  def name_lookup
    while true do
      print "\n"
      puts "Enter name to see how popular a name is in NYC. Type 'menu' if you want to go back"
      name_search = gets.chomp
      ask_user if name_search == "menu"
      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?nm=#{name_search}")
      parsed_response = JSON.parse(response.body)
      result = parsed_response.sort_by! { |entry| entry["rnk"]}
        if result.first == nil
          print "\n"
          puts "Sorry, #{name_search.capitalize} didn't make this 2011 list. Guess you're just ahead of the times!"
          break
        else
          print "\n"
          puts "-----------------------------------------------------------------"
          puts "#{result.first["nm"].capitalize} is a ##{result.first["rnk"]} ranked name with a count of #{result.first["cnt"]} in New York City."
          puts "-----------------------------------------------------------------"
          puts "Would you like to check another name? (y or n)"
          choice = gets.chomp
          return false if choice == "n"
        end
    end
 end

  def name_mixer
    puts "
    Enter [1] for mixing two girl names
    Enter [2] for mixing two boy names
    Enter [3] for surprise me!
    Enter [4] for celebrity name mixin"

    mixing_type = gets.chomp.to_i
      case mixing_type
        when 1
          g_mix
        when 2
          b_mix
        when 3
          name_any
        when 4
          celeb_mix
      end
  end

  def g_mix
    while true do
      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?gndr=FEMALE")
      parsed_response = JSON.parse(response.body)
      x = parsed_response.map { |entry| entry["nm"] }
      name_1 = x.shuffle.last
      name_2 = x.shuffle.first
      combined_names = name_1 + name_2
      combined_names.split("")
      slice_amt = (combined_names.length)/3
      slice_amt.times { combined_names.slice!(slice_amt) }
      print "\n"
      puts "We came up with the best baby girl name for you:
        #{combined_names}!"
      print "\n"
      puts "Could I make an EVEN better name for you? (y or n)"
      answer = gets.chomp.downcase
        if answer == "n"
          print "\n"
          puts "Glad you really liked #{combined_names}!"
        return false if answer == "n" 
        end
    end
  end

  def b_mix
    while true do
      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json?gndr=MALE")
      parsed_response = JSON.parse(response.body)
      x = parsed_response.map { |entry| entry["nm"] }
      name_1 = x.shuffle.last
      name_2 = x.shuffle.first
      combined_names = name_1 + name_2
      combined_names.split("")
      slice_amt = (combined_names.length)/3
      slice_amt.times { combined_names.slice!(slice_amt) }
      print "\n"
      puts "We came up with the best baby boy name for you:
        #{combined_names}!"
      print "\n"
      puts "Could I make an EVEN better name for you? (y or n)"
      answer = gets.chomp.downcase
        if answer == "n"
          print "\n"
          puts "Glad you really liked #{combined_names}!"
          return false if answer == "n" 
        end
    end
  end

  def name_any
    while true do
      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json")
      parsed_response = JSON.parse(response.body)
      x = parsed_response.map { |entry| entry["nm"] }
      name_1 = x.shuffle.last
      name_2 = x.shuffle.first
      combined_names = name_1 + name_2
      combined_names.split("")
      slice_amt = (combined_names.length)/3
      slice_amt.times { combined_names.slice!(slice_amt) }
      print "\n"
      puts "We came up with the best surprise baby name for you:
        #{combined_names}!"
      print "\n"
      puts "Could I make an EVEN better name for you? (y or n)"
      answer = gets.chomp.downcase
        if answer == "n"
          print "\n"
          puts "Glad you really liked #{combined_names}!"
          return false if answer == "n" 
        end
    end
  end

  def celeb_mix
    while true do
      print "\n"
      puts "Name a celebrity! (or yourself)"
      celeb_name = gets.chomp.downcase
      response = HTTParty.get("https://data.cityofnewyork.us/resource/25th-nujf.json")
      parsed_response = JSON.parse(response.body)
      x = parsed_response.map { |entry| entry["nm"] }
      other_name = x.shuffle.last.downcase
        if celeb_name.length > 11
          mixup = celeb_name.split("")
          mixup.shuffle! 
          celeb_name = mixup.join
        end
      combined_names = other_name + celeb_name
      combined_names.split("")
      slice_amt = (combined_names.length)/3
      slice_amt.times { combined_names.slice!(slice_amt) }
      combined_names.delete!(" ")
      print "\n"
      puts "We came up with the best surprise baby name for you:
      #{combined_names.upcase}!"
      print "\n"
      puts "Could I make an EVEN better name for you? (y or n)"
      answer = gets.chomp.downcase
        if answer == "n"
          print "\n"
          puts "Glad you really liked #{combined_names.capitalize}!"
          return false if answer == "n"
        end
    end
  end

  def inspira_quote
    quote_list = [
      "We never know the love of a parent till we become parents ourselves. ~ Henry Ward Beecher",
      "It is time for parents to teach young people early on that in diversity there is beauty and there is strength. ~ Maya Angelou",
      "Little League baseball is a very good thing because it keeps the parents off the streets. ~ Yogi Berra",
      "If you want children to keep their feet on the ground, put some responsibility on their shoulders ~ Abigail Van Buren",
      "Parenting is the easiest thing in the world to have an opinion about, but the hardest thing in the world to do. ~ Matt Walsh",
      "Children learn more from what you are than what you teach. ~ W.E.B. DuBois",
      "Children must be taught how to think, not what to think. ~ Margaret Mead"
    ]
    print "\n"
    puts quote_list.shuffle.last
  end

end

Name_gen.new
