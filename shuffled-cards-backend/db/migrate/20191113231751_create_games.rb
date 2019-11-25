class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :player_health_1
      t.integer :player_health_2
      t.string :winner
      t.string :player_1
      t.string :player_2

      t.timestamps
    end
  end
end
