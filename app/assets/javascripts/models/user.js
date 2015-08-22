AGRO.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  avatar: function() {
    if (!this._avatar) {
      this._avatar = new AGRO.Models.Image();
    }

    return this._avatar;
  },

  recentReviews: function() {
    if (!this._recentReviews) {
      this._recentReviews = new AGRO.Collections.Games();
    }

    return this._recentReviews;
  },

  parse: function (response) {
    if (response.avatar) {
      this.avatar().set(response.avatar, { parse: true });
      delete response.avatar;
    }

    if (response.recent_reviews) {
      this.recentReviews().set(response.recent_reviews, { parse: true });
      delete response.recent_reviews;
    }
    
    return response;
  }

});
