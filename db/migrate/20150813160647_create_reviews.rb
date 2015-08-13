class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :author_id, null: false
      t.integer :game_id, null: false
      t.text :body, null: false
      t.integer :rating, null: false

      t.timestamps null: false
    end

    add_index :reviews, :game_id
    add_index :reviews, [:author_id, :game_id], unique: true
  end
end
