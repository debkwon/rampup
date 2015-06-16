
puts "Please enter today's temperature in Celsius."
celsius = gets.chomp
fahrenheit= (celsius.to_i) * (9.0/5)+32
puts "This is " + fahrenheit.to_s + " degrees in Farenheit."