def leap_year

	puts "Please enter a start year."
	start_year = gets.chomp.to_i

	puts "Please enter a end year."
	end_year = gets.chomp.to_i

	#all_years = start_year..end_year

	(start_year..end_year).select do |year|
		if (year % 4 == 0)
			year if (year % 400 == 0) || (year % 100 != 0)
		end
		
end

puts leap_year(1900,2000)
leap_years