class CreatePlayers < ActiveRecord::Migration
  belongs_to :game
  belongs_to :user
  def change
    create_table "stats" do |t|
      t.integer "game_id"
      t.integer "user_id"
    end
  end
end
