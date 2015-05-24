require './play.rb'
require './game.rb'


p = Player.new

game = TicTacToeGame.new

system("clear")
game.display_board

until game.over?
  #binding.pry
  game.update_board p, p.get_player_move
  system("clear")
  #binding.pry
  game.display_board
  p.switch_player
end


if game.won?

  puts "Game Over, Player #{p.switch_player} is the winner!"

elsif game.tie?
  puts "No more moves available - This game ends in a TIE"
end