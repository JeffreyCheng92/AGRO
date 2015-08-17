json.extract!(@console, :id, :name, :searched)

json.games do
  json.array!(@console.games) do |game|
    json.partial!('api/games/game', game: game, show_reviews: false, show_info: false)
  end
end

json.searched_games do
  json.array!(@console.searched_games) do |game|
    json.partial!('api/games/game', game: game, show_reviews: false, show_info: false)
  end
end
