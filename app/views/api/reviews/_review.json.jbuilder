json.extract!(review, :id, :body, :created_at, :game, :rating, :author_id)
json.num_votes review.num_votes

like = review.likes.find_by(user_id: current_user.id) if logged_in?

if like
  json.like do
    json.extract! like, :id, :value
  end
end

json.author do
  json.extract! review.author, :id, :username, :email, :bio, :location, :avatar
  json.review_count review.author.reviews.count
end
