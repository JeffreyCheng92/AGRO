AGRO.Views.reviewItem = Backbone.View.extend({
  template: JST['reviews/review_item'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    'click .edit-review': 'editReview',
    'click .delete-review': 'deleteReview'
  },

  render: function() {
    var id = (typeof current_user === "undefined") ? 0 : current_user.id;

    var content = this.template({
      id: id,
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
        return $(this).attr('data-score');
      }
    });
  },

  editReview: function(event) {
    event.preventDefault();
    var editView = new AGRO.Views.reviewEdit({
      model: this.model,
    });

    $('body').append(editView.render().$el);
  },

  deleteReview: function(event) {
    event.preventDefault();

    this.model.destroy();
    Backbone.history
    .navigate("#/games/" + this.model.get('game').id, { trigger: true });
  },


});
