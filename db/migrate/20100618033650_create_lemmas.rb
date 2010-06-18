class CreateLemmas < ActiveRecord::Migration
  def self.up
    create_table :lemmas do |t|
      t.string :title
      t.text :body
      t.integer :point,:default  => 5

      t.timestamps
    end
  end

  def self.down
    drop_table :lemmas
  end
end
