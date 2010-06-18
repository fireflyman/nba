class CreateCoauthors < ActiveRecord::Migration
  def self.up
    create_table :coauthors do |t|
      t.belongs_to :user
      t.belongs_to :lemma
      t.boolean :activion, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :coauthors
  end
end
