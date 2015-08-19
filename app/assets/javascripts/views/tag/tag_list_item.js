AGRO.Views.tagListItem = Backbone.View.extend({
  template: JST["tags/tag_list_item"],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({ tag: this.model });
    this.$el.html(content);
    return this;
  },

});
