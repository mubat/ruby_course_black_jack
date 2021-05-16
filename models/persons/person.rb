
class Person
  attr_accessor :name, :money
  attr_reader :cards

  def initialize(name)
    @points_amount = 0
    @name = name
    remove_cards
    @money = 0
  end

  def points_amount
    @points_amount = 0
    @cards.each { |card| @points_amount += card.points }
    @points_amount
  end

  def take_card(card)
    @cards.push(card)
    points_amount
  end

  def remove_cards
    @cards = []
  end

  def to_s
    @name
  end
end