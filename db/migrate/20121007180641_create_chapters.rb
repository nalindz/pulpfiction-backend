class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t| 
      t.references :story
      t.timestamps
    end
  end
end
