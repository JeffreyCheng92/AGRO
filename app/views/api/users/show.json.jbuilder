json.extract!( @user, :id, :username, :email, :bio, :location, :avatar)

json.reviews @user.reviews.count
