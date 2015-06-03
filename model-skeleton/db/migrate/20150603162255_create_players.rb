class CreatePlayers < ActiveRecord::Migration
  def change
    create_table "stats" do |t|
      t.integer "game_id"
      t.integer "user_id"
    end
  end
end
