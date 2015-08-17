json.extract!( game, :title, :id, :average_rating)

if show_reviews
  json.reviews do
    json.array!(game.reviews) do |review|
      json.partial! 'api/reviews/review', review: review
    end
  end
end

if show_info
  json.extract!( game, :description, :author_id, :cover, :developer,
                :release_date, :rating, :consoles)
end
