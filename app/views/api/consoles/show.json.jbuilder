json.extract!(@console, :id, :name, :searched)

json.games do
  json.array!(@console.games.order(:title)) do |game|
    json.partial!('api/games/game', game: game, show_reviews: false, show_info: false)
  end
end

json.searched_games do
  # if searched games unordered, do order(:title) here instead of controller
  json.array!(@console.searched_games) do |game|
    json.partial!('api/games/game', game: game, show_reviews: false, show_info: false)
  end
end
