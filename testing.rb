class League_point_calculator
  def initialize
  ask_user
  end
  def ask_user
    puts "This is a league point calculator. Enter 1 to enter scores or 2 to display the current ranking. You can enter 3 if you hate sports."
    user_choice = gets.chomp.to_i
    lpc_options(user_choice)
  end
  def lpc_options(user_choice)
    while user_choice == true

      if user_choice == 1
      puts "Enter the scores in this format: Yankees 5 Mets 4 (no commas, please)."
      entered_scores = gets.chomp
      teams_check(entered_scores)

      if user_choice == 2
      puts "Here's the ranking of the teams:"

      if user_choice == 3
      puts "I thought so."
      return false
      end
      end
    end
  end

  def teams_check(entered_scores)
    splitting_entry = entered_scores.split
    first_team = splitting_entry[0]
    first_score = splitting_entry[1]
    second_team = splitting_entry[2]
    second_score = splitting_entry[3]
  end

end
end

League_point_calculator.new