AGRO.Collections.Images = Backbone.Collection.extend({
  url: 'api/images',

  model: AGRO.Models.Image,

  getOrFetch: function(id) {
    var collection = this;
    var image = collection.get(id);

    if (image) {
      image.fetch();
    } else {
      image = new collection.model({ id: id });
      collection.add(image);
      image.fetch({
        error: function () { collection.remove(image); }
      });
    }

    return image;
  },
});

// AGRO.Collections.images = new AGRO.Collections.Images();
