require_relative 'person'


class Player < Person
  attr_accessor :name :cards
  attr_writer :reveal

  def initialize(name)
    @name = name
    @reveal = false
  end

  def reveal? 
    @reveal
  end
end