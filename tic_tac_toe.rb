require './play.rb'
require './game.rb'


p = Player.new

game = TicTacToeGame.new

system("clear")
print "Which mode?  Enter 1 for 1-player or 2 for 2-player > "
mode = gets.chomp

game.display_board
if mode == "2"

  until game.over?
    game.update_board p, p.get_player_move
    system("clear")
    game.display_board
    p.switch_player
  end
    p.switch_player

elsif mode == "1"
  until game.over?
    #binding.pry
    game.update_board p, p.get_player_move
    system("clear")
    #binding.pry
    game.display_board
    p.switch_player
    avail_spaces = []
    game.board.each do |key, value|
      if value.is_a?(Integer)
        avail_spaces << value
      end
    end
    computer_play = avail_spaces.sample #computer picks one of the avail spaces
    system("clear")
    puts "Computer plays at position #{computer_play}"
    game.update_board p, computer_play #update board with x or y in the position computer picked
    game.display_board
    p.switch_player
  end
  #p.switch_player


else
  puts "You must enter either 1 or 2 for mode"
end


if game.won?

  puts "Game Over, Player #{p.player} is the winner!"

elsif game.tie?
  puts "No more moves available - This game ends in a TIE"
end