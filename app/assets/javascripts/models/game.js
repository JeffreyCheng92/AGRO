AGRO.Models.Game = Backbone.Model.extend({
  urlRoot: "/api/games",

  covers: function() {
    if (!this._covers) {
      this._covers = new AGRO.Collections.Images();
    }

    return this._covers;
  },

  parse: function (response) {
    if (response.covers) {
      this.covers().set(response.covers, { parse: true });
      delete response.covers;
    }

    return response;
  }

});
