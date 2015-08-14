AGRO.Views.reviewForm = Backbone.View.extend({
  template: JST['reviews/review_form'],

  initialize: function(options) {
  },

  events: {
    // "submit form": "addReview",
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  addReview: function(event) {
    event.preventDefault();
    var review = new AGRO.Models.Review();
    var formData = $(event.currentTarget).serializeJSON();
    debugger

  }


});
