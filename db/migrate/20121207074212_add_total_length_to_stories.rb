class AddTotalLengthToStories < ActiveRecord::Migration
  def change
    add_column :stories, :total_length, :integer
  end
end
