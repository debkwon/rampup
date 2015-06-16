
  puts "Hi, I'm Mac. What's your name?"
  $name = gets.chomp

  puts "That's a great name, " + $name+ ". What's your age?"
  age = gets.chomp


def birth_year(age)
	year = 2015-age.to_i
	puts "If my calculation is correct, " + $name +
	", you were either born in " + year.to_s + " or the year before."
end

birth_year(age.to_i)

%x(say "Well, it was nice getting to know you. Seeyah later, ahlligator.") 
