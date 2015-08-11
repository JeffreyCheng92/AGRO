class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.integer :author_id, null: false
      t.text :description, null: false
      t.string :developer, null: false
      t.string :release_date, null: false
      t.string :rating, null: false

      t.timestamps null: false
    end

    add_index :games, :title, unique: true
    add_index :games, :author_id
  end
end
