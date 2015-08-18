class AddUniqueIndexToLikes < ActiveRecord::Migration
  def change
    add_index :likes, [:user_id, :review_id], unique: true
    add_index :likes, :review_id
  end
end
