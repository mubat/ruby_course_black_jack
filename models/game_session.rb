require_relative 'cards_deck'


class GameSession

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    @cards_deck = CardsDeck.new

  end

  def init
    # @cards_deck.give_card_to @player, 2
    # @cards_deck.give_card_to @dealer, 2
    self
  end
end