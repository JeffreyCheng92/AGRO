AGRO.Collections.Games = Backbone.Collection.extend({
  url: "/api/games",

  model: AGRO.Models.Game,

  // comparator: "title",

  getOrFetch: function(id) {
    var collection = this;
    var game = collection.get(id);

    if (game) {
      game.fetch();
    } else {
      game = new collection.model({ id: id });
      collection.add(game);
      game.fetch({
        error: function () { collection.remove(game); }
      });
    }

    return game;
  }
});
