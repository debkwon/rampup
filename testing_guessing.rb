#the breakdown:

#create suspects and put into suspects array..this is what you will compare the guess to 
#choose your guilty suspect
#set guess count = 0

#game is really starting now. provide the list of suspects
#ask for an attribute choice (give options to player)
#then prompt for attribute characteristic (e.g. color, girl or boy)

#check against guilty suspect, if yes, only return matches of that single guess attribute (tell the player this. 
  #if no, then tell the player that and return those that are not that attribute 
#player has to make a guess
  #player has to guess now. if the guess matches, auto win. if not, then remove incorrect guess, reprint sus -= guess, and run game from ask attribute point
#__________________
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
  attr_accessor :guess_count #this is going to change

  def initialize
    @guess_count = 3
    play_game
  end

  def play_game
    create_suspects
    set_guilty_one
    print "\n"
    puts "~~Welcome to a game of Guess Who~~"
    print "\n"
    start_game
  end

  #private

  def create_suspects
    @suspects = [] #creating an empty array of suspects
    suspects << Suspect.new("rachel girl black auburn brown") #creating instances of Suspect class and pushing them into the array of suspects    suspects << Suspect.new("mac boy white black brown") #the description of the suspects is a string of characteristics bc we literally copy pasted this list from the slide. this is why we are using the .split method in the Suspect class initialize method
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
    
    puts suspects.class
  end

  GuessWho.new
end

