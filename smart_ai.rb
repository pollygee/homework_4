require 'pry'
require './game.rb'


class AI 
  def initialize 
    @winning_combos = [[0,1,2],[3,4,5],[6,7,8], [0,4,8],[2,4,6], [0,3,6], [1,4,7], [2,5,8]]
  end

  def get_move board
    #check winning_move, then blocking_move, then corner_move, then center_move then side_move
    @current_board = board
    move =winning_move || blocking_move || corner_move || center_move || side_move
    puts move
    return move 
  end

  def winning_move
    @winning_combos.each do |combo|
      if @current_board[combo[0]] == :o && @current_board[combo[1]] == :o && @current_board[combo[2]] == nil
        return combo[2]
      elsif @current_board[combo[1]] == :o && @current_board[combo[2]] == :o && @current_board[combo[0]] == nil
        return combo[0]
      elsif @current_board[combo[0]] == :o && @current_board[combo[2]] == :o && @current_board[combo[1]] == nil
        return combo[1]
      end
    end
    return nil
  end

  def blocking_move
    #look for a blocking move
    @winning_combos.each do |combo|
      if @current_board[combo[0]] == :x && @current_board[combo[1]] == :x && @current_board[combo[2]] == nil
        return combo[2] 
      elsif @current_board[combo[1]] == :x && @current_board[combo[2]] == :x && @current_board[combo[0]] == nil
        return combo[0]
      elsif @current_board[combo[0]] == :x && @current_board[combo[2]] == :x && @current_board[combo[1]] == nil
        return combo[1]
      end
    end
    return nil
  end

  def corner_move
    # look for a corner move
    corner = [0, 2, 6, 8]
    corner.each do |num|
      if @current_board[num].nil?
        return num 
      end
    end
    return nil
  end

  def center_move
      #find a side to move on
    if @current_board[4].nil?
        return 5
    end
  end

  def side_move
      #find a side to move on
    sides = [1, 3, 5, 7]
    sides.each do |side|
      if @current_board[side].nil?
        return side 
      end
    end
    return nil
  end  
end




