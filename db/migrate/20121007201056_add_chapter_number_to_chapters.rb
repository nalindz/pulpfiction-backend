class AddChapterNumberToChapters < ActiveRecord::Migration
  def change
    add_column :chapters, :chapter_number, :integer
    add_index :chapters, :chapter_number
  end
end
