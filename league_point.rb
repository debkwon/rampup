require_relative 'team.rb'

class LPC
	attr_accessor :team, :team_list
	def initialize
		@team = Team.new
		@team_list = @team.current_teams #create new instances of each team, not calling on a list of teams 
		ask_user 
	end

	def ask_user
		puts "This is a league point calculator. Enter 1 to enter scores or 2 to display the current ranking. You can enter 3 if you hate sports."
		user_choice = gets.chomp.to_i
		lpc_options(user_choice) 
		ask_user unless user_choice == 3
		end
	end

	def lpc_options(user_choice)
		if user_choice == 1
			puts "Enter the scores in this format: Yankees 5 Mets 4 (no commas, please)."
			entered_scores = gets.chomp.downcase
			teams_check(entered_scores)
		end

		if user_choice == 2
			puts "Here's the current ranking:"				
			display_ranking
		end

		if user_choice == 3
			puts "Thought so."
		end
	end

	def teams_check(entered_scores)
		splitting_entry = entered_scores.split
		first_team = splitting_entry[0]
		first_score = splitting_entry[1]
		second_team = splitting_entry[2]
		second_score = splitting_entry[3]
		
			if team_list.key?(first_team.capitalize.to_sym) == false 
				team.add_team(first_team.capitalize.to_sym)
			end

			if team_list.key?(second_team.capitalize.to_sym) == false 
				team.add_team(second_team.capitalize.to_sym)
			end

			if first_score > second_score
				x = team_list[first_team.capitalize.to_sym] #remove next two lines, change to += 3
				x += 3
				team_list[first_team.capitalize.to_sym] = x
			end

			if second_score > first_score
				y = team_list[second_team.capitalize.to_sym]
				y += 3
				team_list[second_team.capitalize.to_sym] = y
			end


			if first_score == second_score
				z = team_list[first_team.capitalize.to_sym]
				z += 1
				team_list[first_team.capitalize.to_sym] = z

				a = team_list[second_team.capitalize.to_sym]
				a += 1
				team_list[second_team.capitalize.to_sym] = a
			end
	end

	def display_ranking
		team.sort_teams
	end

LPC.new

