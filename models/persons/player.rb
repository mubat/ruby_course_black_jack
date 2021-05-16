# frozen_string_literal: true

require_relative 'person'

class Player < Person
  attr_accessor :cards
  attr_writer :reveal

  def initialize(name)
    super(name)
    @reveal = false
  end

  def reveal?
    @reveal
  end
end
