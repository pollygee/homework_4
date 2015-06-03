require 'pry'
require './lib/all'
require './db/setup'

system("clear")
print "Which mode?  Enter 1 for 1-player or 2 for 2-player > "
mode = gets.chomp

if mode == "2"
  p2 = Player.new
elsif mode == "1"
  p2 = AI.new 
end 
p1 = Player.new
game = TicTacToe.new p1, p2
until game.over?
  # system("clear")
  # game.display_board
  game.ask_current_player_for_move
  game.switch_player
  # binding.pry
  # game.update_board game.current_player, player_move
  # system("clear")
  # game.display_board
end

if game.winner
    game.display_board
    puts "#{game.winner} wins"
  elsif game.tie?
    puts "No more moves the game ends in a TIE."
  end


