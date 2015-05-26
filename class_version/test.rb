require 'minitest/autorun'
require 'pry'

require './player'
require './tic_tac_toe'

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

    g.record_move 5
    g.record_move 1

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

    g.record_move 1
    g.record_move 5
    g.record_move 2
    g.record_move 9
    assert_equal nil, g.winner
    
    g.record_move 3

    assert_equal p1, g.winner 
  end
end



