json.extract!( game, :title, :id, :description, :author_id,
                     :developer, :release_date, :rating, :covers )


# if show_reviews
#   json.reviews do
#     json.array!(board.reviews) do |review|
#       json.partial! 'reviews/review', review: review
#     end
#   end
# end
