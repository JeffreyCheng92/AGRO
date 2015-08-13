AGRO.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  avatar: function() {
    if (!this._avatar) {
      this._avatar = new AGRO.Models.Image();
    }

    return this._avatar;
  },

  parse: function (response) {
    if (response.avatar) {
      this.avatar().set(response.avatar, { parse: true });
      delete response.avatar;
    }

    return response;
  }

});
