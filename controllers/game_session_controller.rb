require_relative 'controller_basic'

class GameSessionController < ControllerBasic

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
  end

  def run
    init_game_session
    loop do 
      calculate
      # break unless show_cards?
      circle
    end
    show_cards
    # announce_the_winner @session.winner
  end

  def init_game_session
    # @sesion = GameSession.new(@dealer, @player)
    # @session.init
  end

  def calculate
    # @session.calculate
    # show player's points
  end

  def circle
    # ask player to take cards
    # ask dealer to take cards
  end

  def show_cards?
    # player wants to show
    # or all has 3 cards
  end

  def show_cards
    # puts @dealer.cards
    # puts @player.cards
  end
end