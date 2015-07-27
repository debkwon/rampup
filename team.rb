class Team
	attr_accessor :current_teams
	def initialize
		@current_teams = {
			:Yankees => 0,
			:Mets => 0,
			:Orioles => 0,
			:Pikachu => 0,
			:Charmander => 0,
			:Snorlax => 0
		}
	end

	def add_team(name)
		current_teams[name.to_sym] = 0
	end

	def sort_teams 
		#sorted = current_teams.sort_by(&:last).reverse
		#alpha_sort = Hash[current_teams.sort]

		#sorted = current_teams.sort do |x, y|
		#x.last == y.last ? x.first <=> y.first : y.last <=> x.last
		sorted = current_teams.sort do |a, b| a.last == b.last ? a.first <=> b.first : b.last <=> a.last
		end
		sorted.each { |team, score| puts "#{team} #{score}"}
		
	end
end

#refactor this to make instances of teams
=begin
class Team
	attr_accessor :team_name, :score
	def initialize(team_name, score = 0)
		@team_name = team_name
		@score = score
	
=ed