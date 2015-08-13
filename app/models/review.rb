class Review < ActiveRecord::Base
  validates :author, :game, :body, :rating, presence: true
  validate :user_reviews_game_only_once

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
      errors(:user) << "cannot create multiple reviews for one game"
    end

    # if game.reviewers.include?(author)
    #   error(:game) << "cannot create multiple reviews for one game"
    # end
  end
end
