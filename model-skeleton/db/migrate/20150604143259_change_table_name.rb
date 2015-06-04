class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :players, :user_stats
  end
end
