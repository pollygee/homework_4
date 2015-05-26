require './player'
require './tic_tac_toe'

p1 = Player.new
p2 = Player.new

game = TicTacToe.new p1, p2

until game.over?
  game.ask_current_player_for_move
end

puts "#{game.winner} wins"