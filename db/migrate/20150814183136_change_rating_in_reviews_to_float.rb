class ChangeRatingInReviewsToFloat < ActiveRecord::Migration
  def change
    change_column(:reviews, :rating, :float, null: false)
  end

end
