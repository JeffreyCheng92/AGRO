json.extract!( game, :title, :id, :description, :author_id, :cover,
                     :developer, :release_date, :rating, :average_rating )

if show_reviews
  json.reviews do
    json.array!(game.reviews) do |review|
      json.partial! 'api/reviews/review', review: review
    end
  end
end
