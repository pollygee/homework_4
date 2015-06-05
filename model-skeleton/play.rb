require 'pry'
require './db/setup'
require './lib/all'



system("clear")
print "Which mode?  Enter 1 for 1-player or 2 for 2-player > "

mode = gets.chomp
print "Name for Player 1 > "
p1_name = gets.chomp
if mode == "2"
  p2 = Player.new
  print "Name for Player 2 > "
  p2_name = gets.chomp
elsif mode == "1"
  p2 = AI.new 
  p2_name = "AI"

end 
p1 = Player.new


player1 = User.where(name: p1_name).first
if player1 
  puts "Welcome back, #{player1.name}"
else
  puts "Welcome, new player.  Enjoy your game"
  player1 = User.create! name: p1_name
end

player2 = User.where(name: p2_name).first
if player2 && player2 != "AI"
  puts "Welcome back, #{player2.name}"
else
  player2 = User.create! name: p2_name
  if player2 != "AI"
    puts "Welcome, new player.  Enjoy your game"
  end
end

game = TicTacToe.new p1, p2
this_game_stat = Stat.create!
UserStat.create! user_id: player1.id, game_id: this_game_stat.id
UserStat.create! user_id: player2.id, game_id: this_game_stat.id
until game.over?
  game.ask_current_player_for_move
  game.switch_player
end

if game.winner
    game.display_board
    puts "#{game.winner} wins"
    if game.winner == "X"
      w_id = User.where(name: player1.name).pluck(:id)
      l_id = User.where(name: player2.name).pluck(:id)
    elsif game.winner == "O"
      w_id = User.where(name: player2.name).pluck(:id)
      l_id = User.where(name: player1.name).pluck(:id)
    
    g = Stat.last
    g.looser_id = l_id[0]
    g.winner_id = w_id[0]
    g.save
  elsif game.tie?
    puts "No more moves the game ends in a TIE."
  end
end


if player.name != "AI"
  puts "Player Stats"
  puts player1.name + " Wins: #{Stat.where(winner_id: player1.id).count}" + " Losses: #{Stat.where(looser_id: player1.id).count}"
  puts player2.name + " Wins: #{Stat.where(winner_id: player2.id).count}" + " Losses: #{Stat.where(looser_id: player2.id).count}"
end




