class AddFirstBlockAndLastBlockToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :first_block, :boolean, :default => false
    add_column :blocks, :last_block, :boolean, :default => false
  end
end
