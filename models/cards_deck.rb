require_relative 'card'
require_relative 'cards_variety'

class CardsDeck 

  include CardsVariety

  def initialize
    @taken_cards = []
  end

  def take_card
    loop do 
      card = Card.new(DEGREE.sample, SUITS.sample) # TODO make random cards properties
      return card unless @taken_cards.include?(card) 
    end
    @taken_cards.push(card)
  end

  def give_card_to(person, count = 1)
    count.times { person.take_card(take_card) }
  end

end
