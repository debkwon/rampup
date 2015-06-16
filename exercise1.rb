1+1
name = "Johnny"
"Hey"+name
first_name = "Deborah"
last_name = "on"
address = "123 Wishington Lane"
phone_number = "5555555555"

puts "Your Address is " + address
puts phone_number

def calculate_bmi (weight, height)
	bmi = weight.to_f/height

"Your BMI is " + bmi.to_s

end

print calculate_bmi(2000, 10)

def calculate_groceries
	fruit = 5.0
	meat = 4.0
	vegetables = 6.0
	total = fruit + meat + vegetables

puts "The total price is " + total.to_s
end

calculate_groceries