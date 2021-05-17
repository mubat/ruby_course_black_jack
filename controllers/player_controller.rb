# frozen_string_literal: true

require_relative "../models/persons/player"
require_relative "controller_utils"

##
# Controller to manage Player activity
class PlayerController
  include ControllerUtils

  attr_accessor :player

  def register
    @player = Player.new(prompt("Введите имя"))
    @player.money = 100
    @player
  end
end
