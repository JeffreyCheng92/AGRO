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
    this.onRender();
    return this;
  },

  onRender: function() {
    var view = this;
    this.$('.star-rating').raty('destroy');
    this.$('.star-rating').raty({
      path: '/assets/',
      half: true,
      readOnly: true,
      score: function() {
        // debugger /;
        // console.log(view.model.get("rating"));
            return $(this).attr('data-score');
          }
    });
  }


});
