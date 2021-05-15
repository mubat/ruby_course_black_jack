
class Person
  attr_accessor :points_amount
  attr_reader :cards

  def initialize
    @cards = []
    @points_amount = 0
  end

  def calculate_points
    @cards.each { |card| @points_amount += card.points }
    @points_amount
  end

  def take_cards(cards)

  end

end