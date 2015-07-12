#the breakdown:

#create suspects and put into suspects array..this is what you will compare the guess to 
#choose your guilty suspect
#set guess count = 3

#game is really starting now. provide the list of suspects
#ask for an attribute choice (give options to player)
#then prompt for attribute characteristic (e.g. color, girl or boy)

#check against guilty suspect, if yes, only return matches of that single guess attribute (tell the player this. 
  #if no, then tell the player that and return those that are not that attribute 
#player has to make a guess
  #player has to guess now. if the guess matches, auto win. if not, then remove incorrect guess, reprint sus -= guess, and run game from ask attribute point
################################################
class Suspect
  attr_reader :name, :gender, :skin_color, :hair_color, :eye_color #these susses attributes are staying the same, which is why we are only using the attr_reader

  def initialize(record)
   attributes = record.split #here we are using the .split method to split the string of characteristics
   @name = attributes[0] #setting name to index position 0, and so on..
   @gender = attributes[1]
   @skin_color = attributes[2]
   @hair_color = attributes[3]
   @eye_color = attributes[4]
  end
end

##############################################################
class GuessWho
  attr_reader :suspects, :guilty_one #these are the attributes that we need to reference, but not change later on
  attr_accessor :guess_count #this is going to change, which is why we use attr_accessor

  def initialize
    @guess_count = 3 #making sure that each game starts with 3 guesses
    play_game
  end

  def play_game
    create_suspects
    set_guilty_one
    print "\n"
    puts "~~Welcome to a game of Guess Who~~"
    puts "Be the Detective and find the guilty suspect. You have 3 chances!"
    print "\n"
    start_game
  end

  def create_suspects
    @suspects = [] #creating an empty array of suspects
    suspects << Suspect.new("rachel girl black auburn brown") #creating instances of Suspect class with parameter of deets and pushing them into the array of suspects    suspects << Suspect.new("mac boy white black brown") #the description of the suspects is a string of characteristics bc we literally copy pasted this list from the slide. this is why we are using the .split method in the Suspect class initialize method to reference the different attributes of each instance of the Suspect class that is made as an Array of characteristics
    suspects << Suspect.new("nick boy white brown blue")
    suspects << Suspect.new("angie girl white auburn green")
    suspects << Suspect.new("theo boy white blonde brown")
    suspects << Suspect.new("joshua boy white black brown")
    suspects << Suspect.new("emily girl white blonde blue")
    suspects << Suspect.new("jason boy white blonde green")
    suspects << Suspect.new("john boy white brown blue")
    suspects << Suspect.new("grace girl black black brown")
    suspects << Suspect.new("jake boy white brown brown")
    suspects << Suspect.new("megan girl white blonde green")
    suspects << Suspect.new("ryan boy white auburn brown")
    suspects << Suspect.new("brandon boy white blonde brown")
    suspects << Suspect.new("beth girl white blonde brown")
    suspects << Suspect.new("diane girl black brown brown")
    suspects << Suspect.new("chris boy white black green")
    suspects << Suspect.new("david boy black black brown")
    suspects << Suspect.new("michelle girl black brown brown")
    suspects << Suspect.new("tyson boy black black brown")
    suspects << Suspect.new("ursula girl white auburn green")
  end

  def set_guilty_one
    @guilty_one = suspects.shuffle.last
  end
  

  def start_game
    
    while true do
      if guess_count > 0
        list_suspects
        puts "Choose an attribute: hair, gender, eye, or skin. Type in your choice, or you can type exit to stop playing."
        print "\n"
        puts "............"
        puts "Your choice:"
        choice = gets.chomp.downcase
        puts "............"
        return false if choice == "exit" or ask_questions(choice) == false
      elsif guess_count == 0
            break
      end
    end
  end

  def list_suspects
    print "\n"
    puts "Here's the list of current suspects:"
    puts "------------------------------------"
    suspects.each { |suspect| puts suspect.name.capitalize } #(I think the user should be able to see the other attributes like in the board game version)
    puts "------------------------------------"
   
  end

  def ask_questions(choice)
    case choice
    when "gender" 
      ask_about_gender
    when "skin" 
      ask_about_skin
    when "hair" 
      ask_about_hair
    when "eye" 
      ask_about_eye
    when "exit" 
      false
    end
  end

################################################

def ask_about_gender
  print "\n"
  puts ">Which gender? (girl or boy)"
  print "\n"
  puts "............"
  puts "Your choice:" 
  gender_choice = gets.chomp.downcase
  puts "............"

    if gender_choice != guilty_one.gender
      suspects.reject! { |suspect| suspect.gender == gender_choice }
      print "\n"
      puts "=============================================="
      puts "*The guilty one does NOT identify as a #{gender_choice}.*"
      puts "=============================================="
    end

    if gender_choice == guilty_one.gender
        suspects.keep_if { |suspect| suspect.gender == gender_choice}
        print "\n"
        puts "==========================================="
        puts "*The guilty one does identify as a #{gender_choice}.*"
        puts "==========================================="
    end

  take_a_guess

end

################################################

def ask_about_skin
    print "\n"
    puts ">What skin color? (white or black)"
    print "\n"
    puts "............"
    puts "Your choice:" 
    skin_choice = gets.chomp.downcase
    puts "............"
    
      if skin_choice != guilty_one.skin_color
        suspects.reject! { |suspect| suspect.skin_color == skin_choice }
        print "\n"
        puts "==========================================="
        puts "*The guilty one's skin is NOT #{skin_choice}.*"
        puts "==========================================="
      end

      if skin_choice == guilty_one.skin_color
        suspects.keep_if { |suspect| suspect.skin_color == skin_choice}
        print "\n"
        puts "========================================"
        puts "*The guilty one's skin color is #{skin_choice}.*"
        puts "========================================"
      end

    take_a_guess

  end

################################################

def ask_about_hair
  print "\n"
  puts ">What hair color? (brown, black, blonde, or auburn)"    
  print "\n"
  puts "............"
  puts "Your choice:"
  hair_choice = gets.chomp.downcase
  puts "............"

    if hair_choice != guilty_one.hair_color
      suspects.reject! { |suspect| suspect.hair_color == hair_choice }
      print "\n"
      puts "==========================================="
      puts "*The guilty one's hair color is NOT #{hair_choice}.*"      
      puts "==========================================="
    end

    if hair_choice == guilty_one.hair_color
      suspects.keep_if {|suspect| suspect.hair_color == hair_choice }
      print "\n"
      puts "========================================"
      puts "*The guilty one's hair color is #{hair_choice}.*"
      puts "========================================"
    end

  take_a_guess

end

################################################

def ask_about_eye
  print "\n"
  puts ">What eye color? (brown, blue, or green)"
  print "\n"
  puts "Your choice:"
  puts "............"
  eye_choice = gets.chomp.downcase
  puts "............"

    if eye_choice != guilty_one.eye_color
      suspects.reject! { |suspect| suspect.eye_color == eye_choice }
      print "\n"
      puts "========================================="
      puts "*The guilty one's eye color is NOT #{eye_choice}.*"
      puts "========================================="
    end

    if eye_choice == guilty_one.eye_color
      suspects.keep_if { |suspect| suspect.eye_color == eye_choice }
      print "\n"
      puts "======================================"
      puts "*The guilty one's eye color is #{eye_choice}.*"
      puts "======================================"
    end

  take_a_guess

end

end
################################################

def take_a_guess
    @guess_count -= 1 
    list_suspects
    print "\n"
    puts "Now it's your chance to guess who it is! Enter the suspect's name."
    print "\n"
    puts "............"
    puts "Suspect Guess:"
    guess = gets.chomp.downcase
    puts "............"

    all_suspects = []
    suspects.each { |suspect| all_suspects << suspect.name} #pushing only the names of the suspects into array called all_suspects
    check_name = all_suspects.include?("#{guess}") #checking to see if the guessed name is actually a name on the list

      if guilty_one.name == guess 
        puts "==============================================================="
        puts "Congrats! You guessed correctly! The guilty one was #{guess.capitalize}."
        puts "==============================================================="
        return false #we want the game to end if you have guessed correctly, even if you have chances left. since the game only runs when true in start_game, I set this to false
      end

      if guilty_one.name != guess && check_name == true
            suspects.reject! { |suspect| suspect.name == guess} 
            puts "========================================================================="
            puts "Nope! You hurt #{guess.capitalize}'s feelings. You now have #{guess_count} #{plural_check(guess_count)} left." 
            puts "========================================================================="
      end

      if guilty_one.name != guess && check_name == false
           puts "=========================================================================================="
           puts "That person's not even on the list. Great detective work...you now have #{guess_count} #{plural_check(guess_count)} left."
           puts "=========================================================================================="
      end

      if guess_count == 0
         print "\n"
         puts "..............................."
         puts "Too bad - #{guilty_one.name.capitalize} got away!"
         puts "..............................."
      end

    end  
def plural_check(guess_count)
  if guess_count == 1
    "chance"
  else "chances"
  end
end
################################################
GuessWho.new