class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t| 
      t.references :chapter
      t.integer :previous_page
      t.integer :next_page

      t.timestamps
    end
  end
end
