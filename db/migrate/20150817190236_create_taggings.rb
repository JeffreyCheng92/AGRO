class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id, null: false
      t.integer :game_id, null: false

      t.timestamps null: false
    end

    add_index :taggings, [:game_id, :tag_id], unique: true
    add_index :taggings, :tag_id
  end
end
