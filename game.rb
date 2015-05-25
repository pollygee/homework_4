require 'pry'

class TicTacToeGame
  attr_reader :board, :winning_combos

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
    tie? || won? 
	end

	def won?
		# create var for winning combos i.e. [[1,2,3], [4,5,6] etc.]
		#each over combos call function test_match pass the combo checkng for
    winning_combos = [[1,2,3],[4,5,6],[7,8,9], [1,4,7],[2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    winning_combos.each do |combo|
      #binding.pry
      if test_3_match combo
        return @win = true
      end
    end
    return false
	end

	def test_3_match trio
    # take input (a, b, c) check for a==b && b==c
    @board[trio[0]] == @board[trio[1]] && @board[trio[1]]== @board[trio[2]]
	end

	def tie?
    #binding.pry
    @board.each do |key,value|
      if value.is_a?(Integer)
        return false
      end
    end
    return true
    #check = @board.has_value?(is_a(Integer))
    #puts "Check is #{check}"
    #@board.any?[{|(key,value)| value.is_a(Integer}]
    
	end

end