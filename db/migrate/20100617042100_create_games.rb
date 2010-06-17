class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :title
      t.string :type
      t.text :body
      t.string :place
      t.datetime :match_at

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
