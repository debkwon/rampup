=begin
class Person
	@@person_count = 0

	def initialize
		@@person_count += 1
	end

	def self.counts
		@@person_count
	end
end

apple = Person.new
beans = Person.new
cats = Person.new

puts Person.counts
______________
class Person

	def say_word(word)
		puts "#{word}"
	end

	def say_secret_word
		puts secret_word
	end

	private

	def secret_word
		"this is a secret"
	end
end

max = Person.new

max.say_word("this is a publicly accessible method")
max.say_secret_word
max.secret_word



class Person
	def say_secret

	protected
	def secret
		"this is a secret"
	end

________

class Mammal
	def breathe
		puts "Inhale and Exhale"
	end
end

class Human < Mammal
	def walk
		puts "walking"
	end
end

person = Human.new

person.walk
person.breathe

#you can see that the person has inherited all of Mammal, so that it performs Mammal meth and human meth

class Dolphin < Mammal
	def swim
		puts "swimming"
	end
	end

	dolphin = Dolphin.new
	dolphin.swim
	dolphin.breathe


___________________________________
def guess_who
	suspects = {
		rachel: "girl, black skin, auburn hair, brown eyes", 
		mac: "boy, "
		#list all suspects, or should it be an array, and you can check against rachel[0] == choice, delete from hash
		#of suspects, print new suspect list, and prompt a guess
	}
	puts "You have three chances to guess who the guilty person is. Here is a list of suspects: #{suspects}"

	#Suspect class
	#game class --> 1) has to have the guilty person, 2) # of guesses, 3) suspects


while guesses < 4 do 	
	puts "Choose an attribute: gender, skin color, hair color, eye color"
	choice = gets.chomp



end

guess_who

___________________________________
=end
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
class Suspects
	attr_reader :name, :gender, :skin_color, :hair_color, :eye_color #these susses are staying the same, which is why we are only using the attr_reader

	def initialize(record)
		attributes = record.split
		@name = attributes[0]
		@gender = attributes[1]
		@skin_color = attributes[2]
		@hair_color = attributes[3]
		@eye_color = attributes[4]

	end
end


class GuessWho
	attr_reader :suspects, :guilty_one
	attr_accessor :guess_count #this is going to change

	def create_suspects
	@suspects = []
	suspects << Suspects.new("rachel girl black   auburn     brown")
	suspects << Suspects.new("mac   boy      white    black       brown")
	suspects << Suspects.new("nick          boy     white    brown       blue")
	suspects << Suspects.new("angie        girl      white    auburn    green")
	suspects << Suspects.new("theo         boy       white    blonde    brown")
	suspects << Suspects.new("joshua     boy      white     black      brown")
	suspects << Suspects.new("emily        girl      white     blonde     blue")
	suspects << Suspects.new("jason      boy       white     blonde    green")
	suspects << Suspects.new("john        boy        white    brown      blue")
	suspects << Suspects.new("grace      girl         black     black      brown")
	suspects << Suspects.new("jake        boy        white     brown     brown")
	suspects << Suspects.new("megan    girl         white     blonde     green")
	suspects << Suspects.new("ryan        boy      white    auburn   brown")
	suspects << Suspects.new("brandon  boy      white     blonde  brown")
	suspects << Suspects.new("beth         girl      white     blonde   brown")
	suspects << Suspects.new("diane       girl       black     brown   brown")
	suspects << Suspects.new("chris        boy      white     black     green")
	suspects << Suspects.new("david       boy      black     black    brown")
	suspects << Suspects.new("michelle   girl       black     brown    brown")
	suspects << Suspects.new("tyson        boy      black     black    brown")
	suspects << Suspects.new("ursula       girl       white     auburn  green")


	end

	def set_guilty_one
		@guilty_one = suspects.shuffle.last

	end

	def play_game
		create_suspects #we need to actually call on these now
		set_guilty_one #we need to call on this as well
		start_game
	end

	def start_game
		puts "Welcome to a game of Guess Who?"
		print_list_of_suspects

		while true do 
			if guess_count > 0
				puts "Choose an attribute: gender, skin color, hair color, eye color, "
				puts "You will be prompted to take a guess at which"

				choice = gets.chomp.downcase

			end
	end

	def print_list_of_suspects
		puts "List of Suspects"
		puts "--------------------------------"

		suspects.each do |suspect|
			puts suspect.name.capitalize
		end

		puts "--------------------------------"
	end

	def ask_questions(choice)
		case choice
		when "hair"
			ask_about_hair #you will have to create this as well
		when "gender"
			ask_about_gender
		when "eye"
			ask_about_eye
		when "skin"
			ask_about_skin
		when "exit"
			false
		end

	def ask_about_hair
		puts "What hair color? Black , blonde, auburn"
		hair_choice = gets.chomp.downcase

		if hair_choice !=guilty_one.hair_color
			suspects.reject! { |suspect| suspect.hair_color == hair_choice }
			puts "------"
			puts " The suspect's hair is not #{hair_choice}."
			puts "------"

		end

		if hair_choice == guilty.one.hair_color
			suspects.keep_if {|suspect| suspect.hair_color == hair_choice }
			puts "The suspect's hair IS #{hair_choice}!"
			puts "-----"
			puts

	end

	def take_a_guess
		puts "Now it's time for you to take your guess! Who do you think it is?"
		guess = gets.chomp
		if guess == guilty_one.name
			puts "You have guessed correctly!"

		guess_count += 1
		end
	end



GuessWho.new

=begin
	
THIS IS THE CLASS SNIPPET:
class Suspect
  attr_reader :name, :hair_color, :gender, :eye_color, :skin_color

  def initialize(record)
   attributes = record.split
   @name = attributes[0]
   @gender = attributes[1]
   @skin_color = attributes[2]
   @hair_color = attributes[3]
   @eye_color = attributes[4]
  end

end
class GuessWho
  attr_reader :suspects, :guilty_one
  attr_accessor :guess_count

  def initialize
    @guess_count = 3
    play_game
  end

  private

  def create_suspects
    @suspects = []
    suspects << Suspect.new("rachel girl black auburn brown")
    suspects << Suspect.new("mac boy white black brown")
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

  def play_game
    create_suspects
    set_guilty_one
    start_game
  end

  def start_game
    puts "Welcome to Guess Who"
    print_list_of_suspects

    while true do
      if guess_count > 0
        puts "You can choose what attribute to guess by typing hair, gender, eye or"
        puts "skin. You will be prompted to take a guess. You can exit now by typing exit:"

        choice = gets.chomp.downcase

        return false if choice == "exit" or ask_questions(choice) == false
      end
    end
  end

  def print_list_of_suspects
    puts "List of Suspects"
    puts "----------------------------------------"

    suspects.each do |suspect|
      puts suspect.name.capitalize
    end

    puts "-----------------------------------------"
  end

  def ask_questions(choice)
    case choice
    when "hair"
      ask_about_hair
    when "gender"
      ask_about_gender
    when "eye"
      ask_about_eye
    when "skin"
      ask_about_skin
    when "exit"
      false
    end

  end

  def ask_about_hair
    puts "----------------------------------"
    puts "What hair color? (brown, black, blonde, auburn)"

    hair = gets.chomp.downcase

    if hair != guilty_one.hair_color
      suspects.reject! { |suspect| suspect.hair_color == hair }

      puts "---------------------------------"
      puts "The suspect's hair color is not #{hair}"
      puts "---------------------------------"
    end

    if hair == guilty_one.hair_color
      suspects.keep_if {|suspect| suspect.hair_color == hair }

      puts "----------------------------------------"
      puts "The suspect's hair color is #{hair}"
      puts "----------------------------------------"
    end
    take_a_guess
  end
end

GuessWho.new

	
=end


