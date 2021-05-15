require_relative 'cards_deck'


class GameSession

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    @cards_deck = CardsDeck.new

  end

  def init
    @cards_deck.give_card_to @player, 2
    @cards_deck.give_card_to @dealer, 2
  end

  def calculate
    @player.calculate_points
    @dealer.calculate_points
  end

  def give_card_to(person, amount = 1)
    @cards_deck.give_card_to(@person, amount)
  end

  def can_continue?
    # player wants to show
    # or all has 3 cards
    @player.reveal? || @player.cards.size == 3 || @dealer.cards.size = 3
  end

end