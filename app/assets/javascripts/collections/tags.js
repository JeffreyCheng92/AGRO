AGRO.Collections.Tags = Backbone.Collection.extend({
  url: "/api/tags",

  model: AGRO.Models.Tag,

  getOrFetch: function(id) {
    var collection = this;
    var tag = collection.get(id);

    if (tag) {
      tag.fetch();
    } else {
      tag = new collection.model({id: id});
      collection.add(tag);
      tag.fetch({
        error: function() { collection.remove(game); }
      });
    }

  },

});
