def talk_granny
	puts "TALK TO GRANNY!"

	while 
		words = gets.chomp

		if words == "BYE"
			puts "BYE, SONNY."
		break
		
		elsif words != words.upcase
			puts "HUH?! SPEAK UP, SONNY!"
		
		else
			rand_year = rand(1930..1980)
			puts "NO, NOT SINCE #{rand_year}!"
	
		end
	end
end

talk_granny