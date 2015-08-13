AGRO.Views.reviewItem = Backbone.View.extend({
  template: JST['reviews/review_item'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    // var users = new AGRO.Collections.Users();
    // var user = users.getOrFetch(this.model.get('author_id'));

    var content = this.template({
      review: this.model
    });

    this.$el.html(content);
    return this;
  }


});
