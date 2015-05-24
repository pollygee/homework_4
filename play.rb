require 'pry'

require './game.rb'


class Player
  attr_reader :player
  def initialize
    @player = :x
  end

  def switch_player
    if @player == :x
      return @player = :y
    else
      return @player = :x
    end
  end

  def get_player_move
    puts "Player #{@player} please pick a position 1 -9 "
    player_position = gets.chomp.to_i    
  end

end

p = Player.new

game = TicTacToeGame.new

game.display_board

until game.over?
  #binding.pry
  game.update_board p, p.get_player_move
  #binding.pry
  game.display_board
  p.switch_player
end


if game.won?
  puts "Game over, someone won"

elsif game.tie?
  puts "No more moves available - This game ends in a TIE"
end
