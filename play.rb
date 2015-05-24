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
    puts "Player #{@player} please pick a position 1 - 9 "
    player_position = gets.chomp.to_i    
  end

end


