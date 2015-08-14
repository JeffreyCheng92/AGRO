AGRO.Views.reviewForm = Backbone.View.extend({
  template: JST['reviews/review_form'],

  tagName: "form",

  initialize: function(options) {
  },

  events: {
    "submit": "submit"
  },

  render: function() {
    this.$el.html(this.template());
    this.onRender();
    return this;
  },

  onRender: function() {
    this.$('#star-rate').raty('destroy');
    this.$('#star-rate').raty({
      path: '/assets/',
      half: true,
      score: 3,
      scoreName: 'review[rating]'
    });
  },

  submit: function (event) {
    event.preventDefault();
    var review = this.model;

    var formData = this.$el.serializeJSON();

    review.save(formData.review, {
      success: function() {
        this.collection.add(review);
        //
        //on navigate, it only renders the body correction but not the username
        // seems i need to visit another game before it resets
        Backbone.history.navigate("#/games/" + this.model.get("game_id"), {trigger: true});
        // Backbone.history.navigate("", {trigger: true});
      }.bind(this),
      error: function(_, response) {
        debugger
      }
    });
  }
});
