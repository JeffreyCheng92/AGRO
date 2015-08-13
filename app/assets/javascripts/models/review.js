AGRO.Models.Review = Backbone.Model.extend({
  urlRoot: "/api/reviews",

  author: function() {
    if (!this._author) {
      this._author = new AGRO.Models.User();
    }

    return this._author;
  },

  parse: function(response) {
    if (response.author) {
      this.author().set(response.author, { parse: true });
      delete response.author;
    }

    return response;
   }

});
