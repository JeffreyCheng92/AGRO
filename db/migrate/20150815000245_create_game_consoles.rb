class CreateGameConsoles < ActiveRecord::Migration
  def change
    create_table :game_consoles do |t|
      t.integer :game_id, null: false
      t.integer :console_id, null: false

      t.timestamps null: false
    end

    add_index :game_consoles, [:game_id, :console_id], unique: true
    add_index :game_consoles, :console_id
  end
end
