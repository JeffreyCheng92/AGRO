AGRO.Views.searchIndex = Backbone.CompositeView.extend({
  template: JST["searches/search_index"],

  initialize: function(options) {
    this.games = options.games;
    this.games.reset();
    this.games.each(this.addGameListItem.bind(this));

    this.listenTo(this.games, "add", this.addGameListItem);
    this.listenTo(this.games, 'sync', this.render);
  },

  render: function() {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },

  addGameListItem: function(game) {
    var view = new AGRO.Views.gameListItem({ model: game });
    this.addSubview('.games-table', view);
  },

});
