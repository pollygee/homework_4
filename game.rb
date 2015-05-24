require 'pry'

class TicTacToeGame
  attr_reader :board

  def initialize
    @board = {1 => 1, 2 => 2, 3=> 3, 4 => 4, 5 => 5, 6 => 6, 7=> 7, 8 =>8, 9 => 9 }
    @win = false
    @tie = false
  end

  def display_board
    puts "#{@board[1]} | #{@board[2]} | #{@board[3]}"
    puts "---------"
    puts "#{board[4]} | #{board[5]} | #{board[6]}"
    puts "---------"
    puts "#{board[7]} | #{board[8]} | #{board[9]}"
  end
  def update_board player_instance, position_number
    if @board[position_number] != :x && @board[position_number] != :y #check that position hasn't already been claimed by x or y
      @board[position_number] = player_instance.player #sub value at pos number to x or y depending on player
    end
  end
	def over?
    @win || @tie 
	end

	def won?
		# create var for winning combos i.e. [[1,2,3], [4,5,6] etc.]
		#each over combos call function test_match pass the combo checkng for
    winning_combos = [[1,2,3],[4,5,6],[7,8,9], [1,4,7],[2,5,8], [3,6,9], [1,5,7], [3,5,7]]
    winning_combos.each do |combo|
      if test_3_match combo
        puts "Game over, someone won"
        return @win = true
      end
    end
	end

	def test_3_match trio
    # take input (a, b, c) check for a==b && b==c
    trio[0] == trio[1] && trio[1]== trio[2]
	end

	def tie?
    @board.each do |key, value|
      if value != :x || value != :y #keep going unless the block is still a number
        return false
      end    
      return true
    end
	end

end