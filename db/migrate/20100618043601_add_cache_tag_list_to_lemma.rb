class AddCacheTagListToLemma < ActiveRecord::Migration
  def self.up
    add_column :lemmas, :cache_tag_list, :string
  end

  def self.down
    remove_column :lemmas, :cache_tag_list
  end
end
