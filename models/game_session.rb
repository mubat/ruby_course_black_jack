require_relative 'cards_deck'


class GameSession
  attr_accessor :bank

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    @cards_deck = CardsDeck.new
    @bank = 0
  end

  def init
    @bank = 0
    @player.reveal = false
    @player.remove_cards 
    @dealer.remove_cards
    give_card_to(@player, 2)
    give_card_to(@dealer, 2)
end

  def give_card_to(person, amount = 1)
    amount.times do 
      person.take_card(@cards_deck.take_card)
    end
  end

  def game_ended?
    # player wants to show
    # or all has 3 cards
    @player.reveal? || @player.cards.size == 3 || @dealer.cards.size == 3
  end

  def winner
    return @dealer if @player.points_amount > 21
    return @player if @dealer.points_amount > 21
    return nil if @player.points_amount == @dealer.points_amount
    @player.points_amount > @dealer.points_amount ? @player : @dealer
  end

  def make_bet(person, amount = 10)
    return false if person.money < amount
    person.money -= amount
    @bank += amount
    true
  end
end