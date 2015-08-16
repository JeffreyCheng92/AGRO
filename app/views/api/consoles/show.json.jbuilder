json.extract!(@console, :id, :name)

json.games do
  json.array!(@console.games) do |game|
    json.partial!('api/games/game', game: game, show_reviews: false)
  end
end
