json.extract!( @user, :id, :username, :email, :bio, :location, :avatar, :karma)

json.reviews @user.reviews.count

json.recent_reviews do
  json.array!(@user.recent_reviews) do |game|
    json.extract!(game, :id, :title)
  end
end
