# frozen_string_literal: true

require_relative "person"

##
# Describe player, what he can do in the game.
# :reveal - Additionaly instance store player desicion to continue the game or not
class Player < Person
  attr_writer :reveal

  def initialize(name)
    super(name)
    @reveal = false
  end

  def reveal?
    @reveal
  end
end
