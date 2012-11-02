class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t| 
      t.references :story
      t.integer :block_number
      t.string :text

      t.timestamps
    end

    add_index :blocks, :block_number
  end
end
