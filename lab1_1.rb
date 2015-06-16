
def temp_converter(f_degrees)
	c_degrees = (f_degrees - 32) * (5.0/9)

puts "This is equivalent to " +c_degrees.to_s+ " degrees Celsius."
end

temp_converter(100)