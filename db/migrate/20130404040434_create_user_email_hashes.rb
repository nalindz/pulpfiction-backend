class CreateUserEmailHashes < ActiveRecord::Migration
  def change
    create_table :user_email_hashes do |t| 
      t.references :user
      t.string :hash_text

      t.timestamps
    end
  end
end
