def pwd_check (password)
	if password.length < 6
		puts "Please enter a password that is at least 6 characters.";
	else 
		puts "Good job!";
end

pwd_check("chyea")