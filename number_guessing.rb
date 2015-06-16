def answer
	answer = rand(100)

	number_guesses = 5

	while number_guesses >0 

		puts "I have chosen a random number. See if you can guess it!
		What is your guess?"

		guess = gets.chomp

		if guess == answer 	
		puts "Congratulations! You got it!"
		break

		elsif guess > answer
			number_guesses-=1
		puts "That was incorrect. Guess lower. You have #{number_guesses} chances left."

		elsif guess < answer
			number_guesses-=1
		puts "That was incorrect. Guess higher. You have #{number_guesses} chances left."

		else 
		puts "Game over."

		end
		

	end

end

answer


