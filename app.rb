# frozen_string_literal: true

require_relative 'controllers/сontroller_basic'
require_relative 'controllers/game_session_controller'
require_relative 'controllers/player_controller'
require_relative 'models/persons/dealer'

##
# Base class of the program
# run `run` method on instance to start the program
class App < ControllerBasic
  def run
    puts 'Игра Black Jack из серии `состряпано на коленке`'

    player_controller = PlayerController.new
    player_controller.register

    loop do
      puts "У игрока сейчас #{player_controller.player.money} на счету."
      break unless confirm('Начать новую игру?')

      GameSessionController.new(dealer, player_controller.player).run
    end

    puts 'Программа завершила работу.'
  end

  def dealer
    dealer = Dealer.new
    dealer.money = 100
    dealer
  end
end

App.new.run
