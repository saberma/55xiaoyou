class AddViewsToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :views, :integer, :default => 0
    add_index :games, :views
  end

  def self.down
    remove_index :games, views
    remove_column :games, :views
  end
end
