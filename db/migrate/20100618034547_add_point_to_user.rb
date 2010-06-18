class AddPointToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :point, :integer, :default => 0
  end

  def self.down
    remove_column :users, :point
  end
end
