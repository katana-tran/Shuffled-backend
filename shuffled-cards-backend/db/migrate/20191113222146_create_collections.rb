class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :card_id
      t.integer :deck_id

      t.timestamps
    end
  end
end
