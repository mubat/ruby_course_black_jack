
class Person
  attr_accessor :name, :points_amount
  attr_reader :cards

  def initialize(name)
    @cards = []
    @points_amount = 0
    @name = name
  end

  def calculate_points
    @cards.each { |card| @points_amount += card.points }
    @points_amount
  end

  def take_card(card)
    @cards.push(card)
  end

  def to_s
    @name
  end
end