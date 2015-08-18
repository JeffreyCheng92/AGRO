json.extract!(@tag, :id, :label, :games)

json.games @tag.games.order(:title)
