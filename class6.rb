#this is class number 6 notes (use #self.whatever when changing instance variable)
#use only one Class per file..definitely use require and split them out
=begin
class Person
	def name
		@name
	end

	def name=(name)
		@name = name
	end

	def shout_name
		name.upcase #reference name variable in class that has not been created yet..this could be self.name.upcase
	end

	def whoa
		puts "hi, whoa"
	end

	def change_name
		self.name = "Metta" #only when you're setting it will you need to actually use self.name (example)
	end
end

person = Person.new
person.name = "Joe"
puts person.name
puts person.shout_name

puts person.change_name

#in modules you can have classes, but you can't initialize a module (ie Person.new)
=end

module Speaking
end

module MicrosoftOffice
	class Document
	end
end

module GoogleDoc
	class Document
	end
end

MicrosoftOffice::Document.new #avoiding name clash
GoogleDoc::Document.new


module Mammal
	def breathe_air
		puts "inhale exhale breathe air"
	end
end

module Feline
	def purr
		puts "purr"
	end
end

class Cat
	include Mammal
	include Feline
end

cat = Cat.new
cat.purr
cat.breathe_air











