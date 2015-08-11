AGRO.Views.gameIndex = Backbone.CompositeView.extend({
  template: JST["games/game_index"],

  initialize: function(options) {
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addGameListItem);

    this.collection.each(this.addGameListItem.bind(this));
  },

  render: function () {
    this.$el.html(this.template());
    this.attachSubviews();

    return this;
  },

  addGameListItem: function(game) {
    var view = new AGRO.Views.gameListItem({ model: game });
    this.addSubview('.game-list', view);
  },

});
