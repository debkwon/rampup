def talk_granny
	puts "TALK TO GRANNY!"
	rand_year = rand(1930..1980)
	goodbye = 0

	while goodbye <3 
		words = gets.chomp
		
		if words == "BYE"
			goodbye += 1
				if goodbye < 2
					puts "ARE YOU SURE YOU WANT TO GO NOW? I DON'T TALK TO YOU AS MUCH ANYMORE."
				elsif goodbye == 3
					puts "BYE!!"

				end
		#elsif goodbye == 3
		# puts "FOINE. GO HOME, THEN. BUT TAKE THESE CONTAINER OF COOKIES WITH YOU. AND ALSO THIS POT OF SOUP.
		# AND ALSO THESE LEFTOVERS."
		# break
		elsif words != words.upcase || words.empty?
			puts "HUH?! SPEAK UP, SONNY!"
			goodbye = 0
		else puts "NO, NOT SINCE #{rand_year}!"
			goodbye = 0
		end
	end
end

talk_granny

