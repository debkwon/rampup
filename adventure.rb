class Options 
	attr_reader :options

	def initialize
		@options = options
	end
end

class Adventure
	attr_accessor :remaining_time
def initialize
	@remaining_time = 120
	intro
end

def intro
	puts "Welcome to a choose your own adventure game. Please enter your age."
	print "\n"
	user_age = gets.chomp.to_i
	age_check(user_age)
end

def start_game
	puts "Thank you. Here's the scenario. You come home to find your roommate is missing."
	print "\n"
	puts "You find a note that says to call the 555-halpp number by 4PM today or you'll never see Garfield again. It's 2PM now. You only have 120 minutes. Do you make a sandwich first or do you call the number? Enter 1 for sandwich or 2 for phone call."

	#while @remaining_time > 0 do 
		puts "Choose 1 or 2"
		#list_of_options
		#first_choice = gets.chomp.to_i
		#adventure_start(first_choice)
	#end
end

def age_check(user_age)
		if user_age < 13
		puts "Sorry, you're too young to play."
		else 
			print "\n"
			start_game
		end
	#end
end
=begin	
def create_options
	@options = []
	options << options.new(napping_it)

end

def list_of_options
	print "\n"
	print options
end

def adventure_start(first_choice)

	if first_choice == 1
		napping_it
	if first_choice == 2
		phoning_it
	end
end


def napping_it
	puts "After you eat your sandwich, you decide to take a nap. You have #{remaining_time} left. Do you set an alarm or do you just hit the hay? (1 or 2)"
	nap_choice = gets.chomp.to_i	
	if nap_choice == 1
		puts "Great! You're super well-rested and still have a few hours before that pesky deadline. Do you call now? (y or n)"
		calling = gets.chomp
		nap_phone(calling)
	if nap_choice == 2
		puts "You have overslept and your woken up by a phone call from a number you don't recognize. Do you answer or go back to sleep? (1 or 2)"
	end

end	

def phoning_it
	puts "You pick up your phone and you see that Shia LaBouef is calling you..AGAIN. Do you ignore the call or do you pick up? (1 or 2)"
	phone_choice = gets.chomp.to_i
	if phone_choice == 1
		puts "Phew. Shia went to voicemail. You decide to call the number on the mysterious note. A strange voice answers. (1 or 2)"
		meeting = gets.chomp.to_i
		addressing_it(meeting)
	if phone_choice == 2
		puts ""
	end
end

def addressing_it(meeting)

end

def nap_phone(calling)

end

def calling

end
=end
end
Adventure.new
