class CreateUsers < ActiveRecord::Migration
  has_many :players
  has_many :games through :players
  def change
    create_table "users" do |t|
      t.string "name"
    end
  end
end
