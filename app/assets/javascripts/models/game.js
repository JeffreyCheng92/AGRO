AGRO.Models.Game = Backbone.Model.extend({
  urlRoot: "/api/games",

  cover: function() {
    if (!this._cover) {
      this._cover = new AGRO.Models.Image();
    }

    return this._cover;
  },

  parse: function (response) {
    if (response.cover) {
      this.cover().set(response.cover, { parse: true });
      delete response.cover;
    }

    return response;
  }

});
