# frozen_string_literal: true

require_relative "card"
require_relative "cards_variety"

##
# Implements the deck of cards.
# Can give some card and check that it not duplicate of previously given
class CardsDeck
  include CardsVariety

  def initialize
    @taken_cards = []
  end

  def take_card
    loop do
      card = Card.new(DEGREE.sample, SUITS.sample) # TODO: make random cards properties
      unless @taken_cards.include?(card)
        @taken_cards.push(card)
        return card
      end
    end
  end
end
