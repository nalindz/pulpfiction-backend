class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :story
      t.string :text

      t.timestamps
    end
  end
end
