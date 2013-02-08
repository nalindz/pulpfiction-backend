class RemoveTags < ActiveRecord::Migration
  def change
    drop_table :tags
    add_column :stories, :tags, :string
  end
end
