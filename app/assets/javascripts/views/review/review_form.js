AGRO.Views.reviewForm = Backbone.View.extend({
  template: JST['reviews/review_form'],

  initialize: function(options) {
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  }


});
