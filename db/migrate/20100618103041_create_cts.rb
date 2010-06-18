class CreateCts < ActiveRecord::Migration
  def self.up
    create_table :cts do |t|
      t.belongs_to :user
      t.belongs_to :game

      t.timestamps
    end
  end

  def self.down
    drop_table :cts
  end
end
