class AddHitsToLemma < ActiveRecord::Migration
  def self.up
    add_column :lemmas, :hits, :integer, :default => 0
  end

  def self.down
    remove_column :lemmas, :hits
  end
end
