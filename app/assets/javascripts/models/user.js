AGRO.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  avatars: function() {
    if (!this._avatars) {
      this._avatars = new AGRO.Collections.Images();
    }

    return this._avatars;
  },

  parse: function (response) {
    if (response.avatars) {
      this.avatars().set(response.avatars, { parse: true });
      delete response.avatars;
    }

    return response;
  }

});
