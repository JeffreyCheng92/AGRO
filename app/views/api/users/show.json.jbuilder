json.extract!( @user, :id, :username, :email, :bio, :location, :avatar, :karma)

json.reviews @user.reviews.count
