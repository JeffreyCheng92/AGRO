AGRO.Models.Game = Backbone.Model.extend({
  urlRoot: "/api/games",

  cover: function() {
    if (!this._cover) {
      this._cover = new AGRO.Models.Image({
        imageable_id: this.id,
      });
    }

    return this._cover;
  },

  reviews: function() {
    if (!this._reviews) {
      this._reviews = new AGRO.Collections.Reviews();
    }
    return this._reviews;
  },

  parse: function (response) {
    if (response.cover) {
      this.cover().set(response.cover, { parse: true });
      delete response.cover;
    }

    if (response.reviews) {
      this.reviews().set(response.reviews, { parse: true });
      delete response.reviews;
    }

    return response;
  }

});
