AGRO.Collections.Reviews = Backbone.Collection.extend({
  url: "api/reviews",

  model: AGRO.Models.Review,

  getOrFetch: function(id) {
    var collection = this;
    var review = collection.get(id);

    if (review) {
      review.fetch();
    } else {
      review = new collection.model({ id: id });
      collection.add(review);
      review.fetch({
        error: function () { collection.remove(review); }
      });
    }

    return review;
  },
});
