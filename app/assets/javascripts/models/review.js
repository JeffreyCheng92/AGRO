AGRO.Models.Review = Backbone.Model.extend({
  urlRoot: "/api/reviews",

  author: function() {
    if (!this._author) {
      this._author = new AGRO.Models.User();
    }

    return this._author;
  },

  like: function() {
    if (!this._like) {
      this._like = new AGRO.Models.Like();
    }

    return this._like;
  },

  parse: function(response) {
    if (response.like) {
      this.like().set(response.like, { parse: true });
      delete response.like;
    }
    if (response.author) {
      this.author().set(response.author, { parse: true });
      delete response.author;
    }

    return response;
  },

  isVoted: function() {
    return !this.like().isNew();
  },

  isUpvoted: function() {
    return (this.like().get('value') === 1) ? true : false;
  },

  isDownvoted: function() {
    return (this.like().get('value') === -1) ? true : false;
  },

  destroy_like: function() {
    this.like().destroy();
    this.like().unset("id");
  },

});
