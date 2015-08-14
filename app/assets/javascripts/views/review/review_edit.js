AGRO.Views.reviewEdit = Backbone.View.extend({
  template: JST["reviews/review_edit"],
  tagName: 'form',

  initialize: function(options) {

  },

  events: {
    'click .edit': 'sendEdit',
  },

  render: function(){
    var content = this.template({ review: this.model });
    this.onRender();
    this.$el.html(content);
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

  sendEdit: function(event) {
    debugger
    event.preventDefault();

    this.model.update(formData.review, {
      success: function() {

      },
      error: function() {

      }
    });
  },

});
