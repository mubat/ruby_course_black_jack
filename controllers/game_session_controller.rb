require_relative 'сontroller_basic'
require_relative '../models/game_session'

class GameSessionController < ControllerBasic

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
  end

  def run
    init_game_session
    loop do 
      break if @session.game_ended?
      puts "\n ----------------\n"
      puts "В банке числится $#{@session.bank}."
      show_cards
      ask_move
    end
    show_cards(true)
    announce_the_winner @session.winner
  end

  def init_game_session
    @session = GameSession.new(@dealer, @player)
    @session.init
  end

  def ask_move
    # ask player to take cards
    ask_player
    # ask dealer to take cards
    ask_dealer
  end

  def show_cards(show_opponent_cards = false)
    puts "Карты у игрока #{@player}: #{@player.cards.join(" ")}. Очков: #{@player.points_amount}" 

    printf "Карты у Дилера: "
    if(show_opponent_cards)
      puts @dealer.cards.join(" ") + ". Очков: #{@dealer.points_amount}"
    else 
      @dealer.cards.size.times { printf "** "}
      puts 
    end
  end

  def ask_player
    puts "Что делаем дальше?\n\t[1] Пропустить\n\t[2] Добавить карту\n\t[3] Раскрыть карты"
    case gets.chomp.to_i
    when 1
      puts "Пропускаем"
    when 2
      puts "Выдать одну карту #{@player}"
      @session.give_card_to(@player)
    when 3
      @player.reveal = true
    else  
      puts "Действие непонятно. Будем считать, что пропускаем"
    end
  end

  def ask_dealer
    @session.give_card_to(@dealer) if @dealer.points_amount < 17
  end

  def announce_the_winner(person)
    if person.nil?
      puts "Ничья." 
      return 
    end
    puts "Победитель #{person}!"
  end
end