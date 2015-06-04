require 'pry'

class Player 
  
  def get_move board
    print 'Please pick a move 1 - 9 > '
    human_move = gets.chomp.to_i
    return human_move -1
  end

end


