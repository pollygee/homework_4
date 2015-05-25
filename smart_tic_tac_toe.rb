require './play.rb'
require './game.rb'
require './smart_ai.rb'
require 'pry'

p = Player.new
game = TicTacToeGame.new

system("clear")
puts "You have selected to play against smart AI"

game.display_board

until game.over?
  #human player
  game.update_board p, p.get_player_move
  system("clear")
  game.display_board
  #binding.pry
  
  #switch to computer player
  p.switch_player
  computer_move = 0
  #look for a winning move
  winning_combos = [[1,2,3],[4,5,6],[7,8,9], [1,4,7],[2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_combos.each do |combo|
    if game.board[combo[0]] == :o && game.board[combo[1]] == :o
      computer_move = game.board[combo[2]]
    elsif game.board[combo[1]] == :o && game.board[combo[2]] == :o
      computer_move = game.board[combo[0]]
    elsif game.board[combo[0]] == :o && game.board[combo[2]] == :o
      computer_move = game.board[combo[1]]
    end
  end

  if computer_move == 0
  #look for a blocking move
    winning_combos.each do |combo|
      if game.board[combo[0]] == :x && game.board[combo[1]] == :x
        computer_move = game.board[combo[2]]
      elsif game.board[combo[1]] == :x && game.board[combo[2]] == :x
        computer_move = game.board[combo[0]]
      elsif game.board[combo[0]] == :x && game.board[combo[2]] == :x
        computer_move = game.board[combo[1]]
      end
    end
  end

  if computer_move == 0
  # look for a corner move
    corner = [1, 3, 7, 9]
    corner.each do |num|
      if game.board[num].is_a?(Integer)
        computer_move = num
      end
    end
  end

  if computer_move == 0
    #move on center if avail
    if game.board[5].is_a?(Integer)
      computer_move = 5
    end
  end

  if computer_move == 0
    #find a side to move on
    sides = [2, 4, 6, 8]
    sides.each do |side|
      if game.board[side].is_a?(integer)
        computer_move == side
      end
    end
  end
  
  
  system("clear")
  puts "Computer plays at position #{computer_move}"
  game.update_board p, computer_move #update board with x or y in the position computer picked
  game.display_board
  p.switch_player
end


if game.won?
  puts "Game Over, Player #{p.player} is the winner!"
elsif game.tie?
  puts "No more moves available - This game ends in a TIE"
end






