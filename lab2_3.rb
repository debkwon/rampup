def talk_granny
	puts "TALK TO GRANNY!"

	while 
		words = gets.chomp

		if words == "BYE"
			puts "ARE YOU SURE YOU WANT TO GO NOW? I DON'T TALK TO YOU AS MUCH ANYMORE."
			second_try
			break
		
		elsif words != words.upcase
			puts "HUH?! SPEAK UP, SONNY!"
		
		else
			rand_year = rand(1930..1980)
			puts "NO, NOT SINCE #{rand_year}!"
	
		end
	end
end

def second_try
	while
		words =gets.chomp
		if words == "BYE"
		puts "REALLY? YOU WOULD DO THIS TO YOUR OWN GRANDMA?!"
		third_try
		else talk_granny
		end
	end
end

def third_try
	words = gets.chomp
	if words == "BYE"
		puts "FOINE. GO HOME, THEN. BUT TAKE THESE CONTAINER OF COOKIES WITH YOU. AND ALSO THIS POT OF SOUP.
		AND ALSO THESE LEFTOVERS."
	else talk_granny
	end
end

talk_granny