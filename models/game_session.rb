require_relative 'cards_deck'


class GameSession

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    @cards_deck = CardsDeck.new

  end

  def init
    @cards_deck.give_card_to(@player, 2)
    @cards_deck.give_card_to(@dealer, 2)
    calculate
end

  def calculate
    @player.calculate_points
    @dealer.calculate_points
  end

  def give_card_to(person, amount = 1)
    @cards_deck.give_card_to(@person, amount)
  end

  def game_ended?
    # player wants to show
    # or all has 3 cards
    @player.reveal? || @player.cards.size == 3 || @dealer.cards.size = 3
  end

  def winner
    return @dealer if @player.points_amount > 21
    return @player if @dealer.points_amount > 21
    return nil if @player.points_amount == @dealer.points_amount
    @player.points_amount > @dealer.points_amount ? @player : @dealer
  end

end