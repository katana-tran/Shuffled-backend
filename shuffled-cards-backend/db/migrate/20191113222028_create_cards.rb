class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :cardId
      t.string :name
      t.string :card_type
      t.integer :mana_cost
      t.integer :health_points
      t.integer :attack
      t.string :card_effect
      t.string :card_description
      t.string :card_img
      t.string :rarity

      t.timestamps
    end
  end
end
