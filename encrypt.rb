def encrypt
	the_hash = {
		"a" => "#",
		"b" => "x",
		"c" => "t",
		"d" => "h",
		"e" => "w",
		"f" => "*",
		"g" => "o",
		"h" => "p",
		"i" => "+",
		"j" => "|",
		"k" => "/",
		"l" => "r",
		"m" => "5",
		"n" => "!",
		"o" => "&",
		"p" => "v",
		"q" => "<",
		"r" => "b",
		"s" => ">",
		"t" => ".",
		"u" => "i",
		"v" => "7",
		"w" => "~",
		"x" => "c",
		"y" => "0",
		"z" => ")",
		" " => "e",
		"." => "f",
		"," => "(",
		"!" => "d"
	}

	decoding_hash = the_hash.invert

	puts "Choose one: encrypt, decode, or end" 
	answer = gets.chomp
		if answer == "encrypt"
			puts "Enter a message."
			message = gets.chomp
			message.downcase!
			chopped_message = message.split("")
			puts "The encrypted message is:"
			chopped_message.each do |string|	
			print "#{the_hash[string]}" 
			end
			print "\n" 
			encrypt
		elsif answer == "decode"
			puts "Tell us the message."
			secret_message = gets.chomp.to_s
			sepsecret_message = secret_message.split("")
			puts "Decoded message is:" 
			sepsecret_message.each do |string|
			print "#{decoding_hash[string]}"					
			end
			print "\n" 
			encrypt
		else puts "Bye"
				
		end			
	
end

encrypt