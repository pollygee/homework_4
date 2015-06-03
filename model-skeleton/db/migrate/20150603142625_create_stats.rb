class CreateStats < ActiveRecord::Migration
  has_many :players
  has_many :users through :players
  
  def change
    create_table "stats" do |t|
      t.integer "winner_id"
      t.integer "looser_id"
    end
  end
end
