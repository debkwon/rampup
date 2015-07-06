
class Player
  attr_accessor :name, :hand, :bankroll #:bet_amount
	def initialize 
		puts "What is your name?"
		@name = gets.chomp.capitalize
		@hand = []
		@bankroll = 1000
	end

	def total_points
		hand.inject(:+)
	end

	def hit?
		puts "Do you want to hit?(y/n)"
		answer = gets.chomp
		answer == "y" ? true : false
	end

	def bust?
		total_points > 21
	end

end

#####################################################################

class Blackjack
	attr_accessor :player, :dealer
		def initialize
			@player = Player.new
			@dealer = Dealer.new
			play_game
		end

		def deck_of_card
			@deck_of_card = (([1,2,3,4,5,6,7,8,9] * 4) + ([10] * 16)).shuffle
		end

		def deal_to_player
			player.hand << deck_of_card.pop
		end

		def deal_to_dealer
			dealer.hand << deck_of_card.pop
		end

		def deal_hands
			2.times do
				deal_to_player
				deal_to_dealer
			end
		end

		def play_game
			puts "Place your bets!"
			#alternative could potentially be to replace bet_amount with @bet_amount
			bet_amount = gets.chomp.to_i
			deal_hands
			puts "You have #{player.total_points} and the dealer's top card is #{dealer.hand[0]}"
			ask_to_hit(bet_amount)
			dealer_play(bet_amount) unless player.bust?
			end
		end

		def ask_to_hit(bet_amount)
			while (player.hit?) do
				deal_to_player
					if player.bust?
						player.bankroll -= bet_amount
						puts "Sorry. You've busted with #{player.total_points}. Your bankroll is now #{player.bankroll}."
						break
					else
						puts "Your total is #{player.total_points}."
					end
			end
		end


	def winner?(bet_amount)
		if !dealer.bust?
			if player.total_points > dealer.total_points
				player.bankroll += bet_amount
				puts "#{player.name}, has won with #{player.total_points}. Your bankroll is now 
				at #{player.bankroll}."
			end
				if player.total_points < dealer.total_points
				player.bankroll -= bet_amount
				puts "Sorry, #{player.name}. The dealer beat you by #{dealer.total_points - player.total_points}. 
				Your bankroll is now at #{player.bankroll}."
			end
				if player.total_points == dealer.total_points
				puts "It's a tie!"
			end

			else
				puts "Dealer bust! #{player.name} wins!"
				player.bankroll += bet_amount
				puts "Your bankroll is now at #{player.bankroll}."
			end
		end


	def dealer_play(bet_amount)
		puts "You stayed at #{player.total_points}, now it's the dealers turn."
		puts "Dealer has a hand total of #{dealer.total_points}."
			while (dealer.hit?) do
				deal_to_dealer
				puts "Dealer draws a #{dealer.hand.last}."
				puts "Dealer has a total of #{dealer.total_points}."
			end
		winner?(bet_amount)
	end

#####################################################################

class Dealer
	attr_accessor :hand

		def initialize
			@hand = []
		end

		def total_points
			hand.inject(:+)
		end

		def hit?
			total_points < 17
		end

		def bust?
			total_points > 21
		end

end


Blackjack.new