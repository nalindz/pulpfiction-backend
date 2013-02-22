class CreateUserAuths < ActiveRecord::Migration
  def change
    create_table :user_auths do |t| 
      t.references :user
      t.string :password

      t.timestamps
    end
  end
end
