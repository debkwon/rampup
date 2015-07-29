class Bill_split
	def initialize
		info_start
	end

	#def info_start
	#	time = Time.new
	#	split_time = time.to_s.split
	#	split_hours = split_time[1].to_i
	#	puts split_hours
	#	end

	def info_start
		time = Time.new
		puts "Welcome! The date/time is #{time}. How many diners are with you?"
		number_diners = gets.chomp.to_i
		puts "Great, #{number_diners} diners."
		
		x = 1
			while number_diners > 0 
				puts "Type Diner #{x}'s initials:"
				number_diners.times { Diner.new }
end

end
Bill_split.new