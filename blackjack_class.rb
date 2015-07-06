=begin
Your homework is to finish the game. For those of you who missed class last week, 
the logic you have to create is player can hit or stay. 
if over 21 they lose. once they stay it's the dealers turn(automatic) 
the dealer logic is they MUST get another card if they have 16 or under. 
If they have 17 or above they MUST stay. if dealer is over 21 they lose.

class Account
    attr_reader :name, :balance
    
    def initialize(name, balance = 100)
        @name = name
        @balance = balance
    end
    
    def display_balance(pin_number)
        pin_number == pin ? "Balance: $#{balance}." : pin_error
    end
    
    def deduct(bet_amount)
            @balance -= amount
            puts "Withdrew #{bet_amount}. New balance:                                #{@balance}."
        end
    end
  
end

checking_account = Account.new("Deb's Account", 1000)
=end
  def greeting
    puts "What is your name?"
    player_name = gets.chomp
    puts "Thank you, #{player_name}."
  end

greeting


class Blackjack
  attr_accessor :player, :dealer, :deck
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = ([1,2,3,4,5,6,7,8,9] * 4 + ([10] * 16)).shuffle!
    game_play
  end

  def deal_to_player
    player.hand << deck.pop
  end

  def deal_to_dealer
    dealer.hand << deck.pop
  end

  def deal_cards
    2.times do
      deal_to_player
      deal_to_dealer
    end
  end

  def game_play
    deal_cards

    while true do
      puts "#{player_name} you have a total of #{player.total_points}"
      puts "Would you like to hit?(y/n)"
      choice = gets.chomp
        if choice == "y"
          deal_to_player
        elsif choice == "n"
          puts "Ok. You stayed at #{player.total_points}"
        break
        end
      end
  end

end

class Player
  def initialize
    @hand = []
  end

  def hand
    @hand
  end

  def total_points
    hand.inject(:+)
  end

  def bust?
    total_points > 21
  end
end

class Dealer
  attr_accessor :hand
  def initialize
    @hand = []
  end

  def total_points
    hand.inject(:+)
  end

  def bust?
    total_points > 21
  end
end

Blackjack.new
