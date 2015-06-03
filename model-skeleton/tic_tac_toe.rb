require './play.rb'
require './game.rb'


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
    game.update_board p, p.get_player_move
    system("clear")
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

