class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :first_team_id
      t.integer :second_team_id
      t.integer :winner_id
      t.string :stage
      t.references :tournament, foreign_key: true

      t.timestamps
    end

    add_index :games, [:first_team_id, :second_team_id, :stage], unique: true
  end
end
