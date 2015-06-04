class AddCreatedAt < ActiveRecord::Migration
  def change 
    add_column :stats, :created_at, :Datetime
  end
end
