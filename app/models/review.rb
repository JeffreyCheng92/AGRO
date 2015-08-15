# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  game_id    :integer          not null
#  body       :text             not null
#  rating     :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ActiveRecord::Base
  validates :author, :game, :body, :rating, presence: true
  validate :user_reviews_game_only_once, on: :create

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id
  )

  belongs_to(
    :game,
    class_name: :Game,
    foreign_key: :game_id
  )

  def user_reviews_game_only_once
    if author.reviewed_games.include?(game)
      errors[:You] << "can't create multiple reviews for one game."
    end
  end
end
