class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t| 
      t.references :story

      t.timestamps
    end
  end
end
