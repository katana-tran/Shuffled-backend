class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :display_name
      t.string :avatar_picture
      t.integer :coin

      t.timestamps
    end
  end
end