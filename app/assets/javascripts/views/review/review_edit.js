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
    this.$el.html(content);
    this.onRender();
    return this;
  },

  onRender: function() {
    var view = this;
    debugger;
    this.$('#star-rerater').raty('destroy');
    this.$('#star-rerater').raty({
      path: '/assets/',
      half: true
      // score: function() {
      //   return $(this).attr('data-score');
      // }
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
