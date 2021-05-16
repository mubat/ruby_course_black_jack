# frozen_string_literal: true

##
# General class for all game participants
# They have:
#   name - person's name, how to print it
#   money - amount of money what he has
#   cards - a list of cards what he has on hands
#   points_amount - calculated amount of the points according cards on his hands
# Can:
#   `take_card` - take a card
#   `remove_cards` - clear hands from the cards
#
# `points_amount` automatically calculates when Person takes the card
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
