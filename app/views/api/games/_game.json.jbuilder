json.extract!( game, :title, :id, :average_rating, :cover)

if show_reviews
  json.reviews do
    json.array!(game.reviews) do |review|
      json.partial! 'api/reviews/review', review: review
    end
  end
end

if show_info
  json.extract!( game, :description, :author_id, :developer,
                :release_date, :rating, :consoles, :tags)
end
