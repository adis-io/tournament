class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :tournament, foreign_key: true
      t.integer :wins, default: 0
      t.string :stage

      t.timestamps
    end
  end
end
