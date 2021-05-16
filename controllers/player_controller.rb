require_relative '../models/persons/player'


class PlayerController < ControllerBasic

  attr_accessor :player

  def register
    @player = Player.new(prompt("Введите имя"))
    @player.money = 100
    @player
  end

end