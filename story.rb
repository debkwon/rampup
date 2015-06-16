def prompt
	puts "You're a traveler on a long journey. After
	many miles, you come to a fork in the road. To the North is a small village.
	To the East is a dark cave. Which way do you go? North or East?"

	direction = gets.chomp

	journey(direction)
end

def journey(direction)

	if direction == "East" 
		puts "You proceed to walk East and have contracted dysentery. Goodbye."
	elsif direction == "North"
		puts "You have arrived safely at the village!"
	else 
		puts "Try choosing a different direction."
	end
end

prompt