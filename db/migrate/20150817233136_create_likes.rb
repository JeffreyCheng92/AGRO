class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :review_id, null: false
      t.integer :user_id, null: false
      t.integer :value, null: false

      t.timestamps null: false
    end
  end

end
