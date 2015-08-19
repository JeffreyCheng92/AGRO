json.extract!(tag, :id, :label)

json.games tag.games.order(:title)
