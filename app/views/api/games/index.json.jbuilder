json.array!(@games) do |game|
  json.partial!('game', game: game, show_reviews: false, show_info: false)
end
