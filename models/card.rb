# frozen_string_literal: true

##
# Describe one card. 
# can calculate popint for itself and compare it with other card
class Card
  attr_accessor :name, :suite

  def initialize(name, suite)
    @name = name.is_a?(Integer) ? name.to_s : name
    @suite = suite
  end

  def points
    # TODO: need to add support of two variants of Ace
    @name.match(/^\d+$/) ? @name.to_i : 10
  end

  def ==(other)
    other.instance_of?(Card) && @name == other.name && @suite == other.suite
  end

  def to_s
    @name.to_s + @suite
  end
end
