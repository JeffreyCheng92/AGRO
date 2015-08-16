AGRO.Collections.Consoles = Backbone.Collection.extend({
  url: "/api/consoles",

  model: AGRO.Models.Console,

  getOrFetch: function(id) {
    var collection = this;
    var consoul = collection.get(id);

    if (consoul) {
      consoul.fetch();
    } else {
      consoul = new collection.model({ id: id });
      collection.add(consoul);
      consoul.fetch({
        error: function () { collection.remove(consoul); }
      });
    }

    return consoul;

  },

});
