AGRO.Collections.Users = Backbone.Collection.extend({
  url: "/api/users",

  model: AGRO.Models.User,

  //may add a mixin into it

  getOrFetch: function(id) {
    var collection = this;
    var user = collection.get(id);

    if (user) {
      user.fetch();
    } else {
      user = new collection.model({ id: id });
      collection.add(user);
      user.fetch({
        error: function () { collection.remove(user); }
      });
    }

    return user;
  },

});
