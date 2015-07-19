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
		sorted = current_teams.sort_by(&:last).reverse
		puts sorted
	end
end

