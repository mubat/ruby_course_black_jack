# frozen_string_literal: true

require_relative 'сontroller_basic'
require_relative '../models/game_session'

##
# Controller that manage game session activity
# It Prints step deatils and ask the Player to make some steps
class GameSessionController < ControllerBasic
  def initialize(dealer, player)
    @dealer = dealer
    @player = player
  end

  def run
    return unless init_game_session

    loop do
      break if @session.game_ended?

      puts "\n ----------------\n"
      puts "В банке числится $#{@session.bank}."
      show_cards
      ask_move
    end
    show_cards(true)
    announce_the_winner @session.winner
    give_winning_to @session.winner
  end

  def init_game_session
    @session = GameSession.new(@dealer, @player)
    @session.init
    return false unless make_bet(@player)
    return false unless make_bet(@dealer)

    true
  end

  def ask_move
    # ask player to take cards
    ask_player
    # ask dealer to take cards
    ask_dealer
  end

  def show_cards(show_opponent_cards = false)
    puts "Карты у игрока #{@player}: #{@player.cards.join(' ')}. Очков: #{@player.points_amount}"

    printf 'Карты у Дилера: '
    if show_opponent_cards
      puts @dealer.cards.join(' ') + ". Очков: #{@dealer.points_amount}"
    else
      @dealer.cards.size.times { printf '** ' }
      puts
    end
  end

  def ask_player
    puts "Что делаем дальше?\n\t[1] Пропустить\n\t[2] Добавить карту\n\t[3] Раскрыть карты"
    case gets.chomp.to_i
    when 1
      puts 'Пропускаем'
    when 2
      puts "Выдать одну карту #{@player}"
      @session.give_card_to(@player)
    when 3
      @player.reveal = true
    else
      puts 'Действие непонятно. Будем считать, что пропускаем'
    end
  end

  def ask_dealer
    @session.give_card_to(@dealer) if @dealer.points_amount < 17
  end

  def announce_the_winner(person)
    if person.nil?
      puts 'Ничья.'
      return
    end
    puts "Победитель #{person}!"
  end

  def give_winning_to(person)
    if person.nil?
      person.money += @session.bank / 2
      @dealer.money += @session.bank / 2
    else
      person.money += @session.bank
    end
    @session.bank = 0
  end

  def make_bet(person, amount = 10)
    if @session.make_bet(person, amount)
      puts "Ставка в банк в размере $#{amount} была сделана игроком #{person}."
      return true
    end
    puts "Игрок #{person} не смог сделать ставку"
    false
  end
end
