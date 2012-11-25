class ChangeBlockFromStringToText < ActiveRecord::Migration
  def change
    remove_column :blocks, :text
    add_column :blocks, :text, :text
  end

end
