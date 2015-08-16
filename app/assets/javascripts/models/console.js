AGRO.Models.Console = Backbone.Model.extend({
  urlRoot: "/api/consoles",

  games: function() {
    if (!this._games) {
      this._games = new AGRO.Collections.Games();
    }

    return this._games;
  },

  parse: function(response) {
    if (response.games) {
      this.games().set(response.games, { parse: true });
      delete response.games;
    }

    return response;
  },

});
