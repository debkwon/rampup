def ml
  
  puts "Let's write a story. Name a thing."
  $thing =gets.chomp

  puts "Now maybe an action."
  $verb = gets.chomp

  puts "Nice. This story is really coming along. What about a descriptive word?"
  $adjective = gets.chomp



  puts "Great! Here's the whole story. I heard you like to " + $verb + " " +$thing + "s. How do you even " + $verb + " the " + $thing+ "? I guess you like " +$thing + 
  " because it is " + $adjective + "."

end

ml