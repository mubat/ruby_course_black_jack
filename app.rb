require_relative 'controllers/сontroller_basic'
require_relative 'controllers/game_session_controller'
require_relative 'controllers/player_controller'
require_relative 'models/persons/dealer'

class App < ControllerBasic

  def run
    puts "Игра Black Jack из серии `состряпано на коленке`"

    playerController = PlayerController.new
    playerController.register

    loop do
      break unless confirm("Начать новую игру?")
      GameSessionController.new(self.dealer, playerController.player).run
    end
    
    puts "Программа завершила работу."
  end

  def dealer
    dealer = Dealer.new
    dealer.money = 100
  end

end

App.new.run