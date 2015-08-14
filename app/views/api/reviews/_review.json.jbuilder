json.extract!(review, :id, :body, :created_at, :game, :rating)

json.author do
  json.extract! review.author, :id, :username, :email, :bio, :location, :avatar
  json.review_count review.author.reviews.count
end
