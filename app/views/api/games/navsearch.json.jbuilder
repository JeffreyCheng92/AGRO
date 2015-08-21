json.array!(@games) do |game|
  json.extract!(game, :title, :id)
end
