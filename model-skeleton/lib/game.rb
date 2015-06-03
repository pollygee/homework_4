require 'pry'

class TicTacToe
  attr_reader :board, :winning_combos, :current_player

  def initialize player1, player2
    @board = Array.new 9

    @x = player1
    @o = player2

    @current_player = @x
  end


  def symbol_for_current_player
    if @current_player == @x
      return :x
    else
      return :o
    end
  end


  def display_board
    @board.each_slice 3 do |row|
      row.each do |entry|
        if entry
          print entry
        else
          print " "
        end
      end
      puts
    end
  end

  def update_board player, position_number
    #@board[position_number] != "X" && @board[position_number] != "Y" #check that position hasn't already been claimed by x or y
    @board[(position_number)]  = symbol_for_current_player #sub value at pos number to x or y depending on player
  end


# call get_move on current player who may be Player or AI
  def ask_current_player_for_move 
    system("clear")
    display_board
    update_board @current_player, (@current_player.get_move @board)
  end


  def over?
    tie? || !winner.nil?
  end

  def winner
    lines = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]

    lines.each do |line|
      entries = line.map { |pos| @board[pos] }
      if entries == [:x,:x,:x]
        return "X"
      elsif entries == [:o,:o,:o]
        return "O"
      end
    end
    return nil
  end

  def test_3_match trio
    # take input (a, b, c) check for a==b && b==c
    @board[trio[0]] == @board[trio[1]] && @board[trio[1]]== @board[trio[2]]
  end

  def switch_player
    if @current_player == @x
      @current_player = @o
    else
      @current_player = @x
    end
  end

  def tie?
    #binding.pry
    @board.all? {|value| !value.nil?}
  end

end