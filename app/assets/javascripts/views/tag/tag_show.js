AGRO.Views.tagShow = Backbone.CompositeView.extend({
  template: JST["tags/tag_show"],

  initialize: function(options) {
    this.model.games().each( this.addGameListItem.bind(this) );

    this.listenTo(this.model.games(), "add", this.addGameListItem);
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({ tag: this.model });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addGameListItem: function(game) {
    var view = new AGRO.Views.gameListItem({ model: game });
    this.addSubview('.games-table', view);
  },


});
