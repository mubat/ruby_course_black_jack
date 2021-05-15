require_relative 'person'


class Player < Person
  attr_accessor :name :cards

  def initialize(name)
    @name = name
  end
end