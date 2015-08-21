AGRO.Views.searchIndex = Backbone.CompositeView.extend({
  template: JST["searches/search_index"],

  initialize: function(options) {
    this.games = options.games;
    this.tags = options.tags;
    this.games.reset();
    this.tags.reset();

    this.listenTo(this.tags, "add", this.addTagListItem);
    this.listenTo(this.games, "add", this.addGameListItem);
    this.listenTo(this.tags, "sync", this.render);
    this.listenTo(this.games, 'sync', this.render);
  },

  render: function() {
    $(".main-body").css("background", "rgba(255, 255, 255, 0.2)");
    var content = this.template({
      games: this.games,
      tags: this.tags,
    });
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addTagListItem: function(tag) {
    var view = new AGRO.Views.tagListItem({ model: tag });
    this.addSubview('.tag-list', view);
  },

  addGameListItem: function(game) {
    var view = new AGRO.Views.gameListItem({ model: game });
    this.addSubview('.games-table', view);
  },

});
