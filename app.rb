require_relative 'controllers/сontroller_basic'

class App < ControllerBasic

  def run
    puts "Игра Black Jack из серии `состряпано на коленке`"

    # playerController = PlayerController.new
    # playerController.register

    loop do
      break unless confirm("Начать новую игру?")
      # session = GameSessionController.new(playerController.player).run
    end
    
    puts "Программа завершила работу."
  end


end

App.new.run