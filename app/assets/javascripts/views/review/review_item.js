AGRO.Views.reviewItem = Backbone.View.extend({
  template: JST['reviews/review_item'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({
      review: this.model
    });

    this.$el.html(content);
    return this;
  }


});
