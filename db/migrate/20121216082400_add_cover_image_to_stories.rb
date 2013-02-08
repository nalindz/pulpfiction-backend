class AddCoverImageToStories < ActiveRecord::Migration
  def change
    add_column :stories, :cover_image, :string
  end
end
