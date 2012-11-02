class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t| 
      t.references :user

      t.timestamps
    end
  end
end
