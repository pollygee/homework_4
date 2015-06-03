require 'minitest/autorun'
require 'pry'

require './play'
require './game'
require './smart_ai.rb'

class TicTacTest < MiniTest::Test
  def test_new_game
    p1 = Player.new
    p2 = Player.new

    g = TicTacToe.new p1,p2

    assert_equal nil, g.winner
    assert_equal p1, g.current_player
    assert_equal :x, g.symbol_for_current_player
    refute g.over?
  end

  def test_can_fill_board
    p1 = Player.new
    p2 = Player.new

    g = TicTacToe.new p1, p2
    refute g.board_full?
    #make moves
    (1..9).each do |square|
      g.record_move square
    end
    assert g.board_full?
  end 

  def test_fills_in_right_letter
    p1 = Player.new
    p2 = Player.new

    g = TicTacToe.new p1, p2

    g.update_board 5
    g.update_board 1

    expected_board = [
      :o, nil, nil,
      nil, :x, nil,
      nil, nil,nil
      ]
    assert_equal expected_board, g.board
  end

  def test_can_determine_winner
    p1 = Player.new
    p2 = Player.new

    g = TicTacToe.new p1, p2

    g.update_board 1
    g.update_board 5
    g.update_board 2
    g.update_board 9
    assert_equal nil, g.winner
    
    g.update_board 3

    assert_equal p1, g.winner 
  end
end



