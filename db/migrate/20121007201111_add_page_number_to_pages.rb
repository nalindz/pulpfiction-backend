class AddPageNumberToPages < ActiveRecord::Migration
  def change
    add_column :pages, :page_number, :integer
    add_index :pages, :page_number
  end
end
