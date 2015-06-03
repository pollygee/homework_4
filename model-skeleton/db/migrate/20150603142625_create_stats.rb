class CreateStats < ActiveRecord::Migration
  def change
    create_table "stats" do |t|
      t.integer "winner_id"
      t.integer "looser_id"
    end
  end
end
