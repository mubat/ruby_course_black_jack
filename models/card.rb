# frozen_string_literal: true

##
# Describe one card.
# can calculate popint for itself and compare it with other card
class Card
  attr_accessor :name, :suite

  def initialize(name, suite)
    @name = name.is_a?(Integer) ? name.to_s : name
    @name = @name.upcase
    @suite = suite
  end

  def points(prefer_ace_more: true)
    # TODO: need to add support of two variants of Ace
    return prefer_ace_more ? 11 : 1 if name == "A"

    @name.match(/^\d+$/) ? @name.to_i : 10
  end

  def ==(other)
    other.instance_of?(Card) && @name == other.name && @suite == other.suite
  end

  def to_s
    @name.to_s + @suite
  end
end
