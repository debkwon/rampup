def song
	bottles = 99

	while bottles >= 0

		if bottles == 1
		
		#puts "2 bottles of beer on the wall, 2 bottles of beer. You take one down and you pass it around, 1 bottle of beer on the wall. 
		
		puts "1 bottle of beer on the wall, 1 bottle of beer. 
			You take one down and you pass it around, no more bottles of beer on the wall. 
			No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 
			99 bottles of beer on the wall."
		break

		else
			puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer. 
			You take one down and you pass it around, #{bottles -=1} #{plural_check(bottles)} of beer on the wall."
		
		
		end
	end
end

def plural_check(x)
	if x >=2
		"bottles"
	else "bottle"
	end
end

song

