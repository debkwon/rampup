=begin

team 1 score
team 2 score

league point calculator and team class required

options: 
--> prompt user to press 1 to enter score or press 2 to display ranking --> output results --> options
if 1, ask for score, then you must break down score

	set teams as an array, ie attr_accessor = [] @team = []

	if teams.include?("yankees"), then give that team
		else teams << Team.new

	compare the two teams
	add the points
	exit and prompt again
	sort by name/points

#eventually split into two files, for each class

nyc open data ==> check for pop data
gentrification calculator...is now the time to buy/rent/sell?

For this lab, you will be building a League Point Calculator. (https://en.wikipedia.org/wiki/Three_points_for_a_win) 
The LPC should be able to do two things. 
#Let the user input scores. The user should be prompted for a final score like this: “Yankees 5 Mets 4” 
#User has the option to output the League Rankings based on points. From highest to lowest. 
If there is a tie then they should be ordered by alphabetical order.

The winning team gets 3 points. Losing team gets 0 points. If the game ends in a tie both teams get 1 point. The output should look something like this:
Yankees 9
Giants 4
Mets 4
Cardinals 0
**** Start thinking about a final project to work on. Please email me your final project idea.  It will be due on Week 8.
=end

#maybe create a hash that has all the teams names as keys and empty arrays as values
=begin
class Team
	attr_accessor :teams, :team_name, :team_score
	def initialize
		@teams = [] #want to create empty array of teams to create instances of, as well as push new teams into
		@team_name = team_name
		@team_score = team_score
	end
		
	def create_teams 
	end

	def existing_team
		if teams[0].include?(team_entry)
	end
end
=end