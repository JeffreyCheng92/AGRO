AGRO.Views.reviewEdit = Backbone.View.extend({
  template: JST["reviews/review_edit"],
  tagName: 'form',

  initialize: function(options) {

  },

  events: {
    'click .edit': 'sendEdit',
    'click .modal-background': 'remove',
    'click .close': 'remoove'
  },

  remoove: function(event) {
    event.preventDefault();
    this.remove();
  },

  render: function(){
    var content = this.template({ review: this.model });
    this.$el.html(content);
    this.onRender();
    return this;
  },

  onRender: function() {
    var view = this;
    this.$('#star-rerater').raty('destroy');
    this.$('#star-rerater').raty({
      path: '/assets/',
      half: true,
      score: view.model.get('rating'),
      scoreName: 'review[rating]'
    });
  },

  sendEdit: function(event) {
    event.preventDefault();
    var formData = this.$el.serializeJSON();
    this.model.set(formData.review);
    this.model.save({}, {
      success: function() {
        this.remove();
      }.bind(this),
      error: function() {

      }
    });
  },

});
