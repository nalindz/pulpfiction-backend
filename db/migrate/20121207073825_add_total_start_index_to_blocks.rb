class AddTotalStartIndexToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :total_start_index, :integer
  end
end
