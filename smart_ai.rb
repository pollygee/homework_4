require 'pry'
require './game.rb'

class AI
  def initialize game_board
    @center = [5]
    @corner = [1, 3, 7, 9]
    @sides = [2, 4, 6, 8]
    @board = game.board
  end



  def winning_move
    winning_combos = [[1,2,3],[4,5,6],[7,8,9], [1,4,7],[2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_combos.each do |combo|
      match = test_2_match(combo) 
    end
      if match > 0
        return match
      end
  end



  def test_2_match trio
    # look to see that there is only one number in the trio
    open_spaces = []
      trio.each do |space_number|
        if space_number.is_a?(Integer)
          open_spaces << space.number
        end
      end
        if open_spaces.count == 1
          return open_spaces[0]
        else 
          return -1
        end
  end

  def empty_spot_move
    avail_spaces = []
    game.board.each do |key, value|
      if value.is_a?(Integer)
        avail_spaces << value
      end
    end
    @corner.each do |position|
        if @board.include?(position)
          return posisition
        end
    end
    @center.each do |position|
      if @board.include?(position)
        return position
      end
    end
    @sides.each do |position|
      if @board.include?(position)
        return position
      end
    end 
  end
end




