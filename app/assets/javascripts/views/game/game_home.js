AGRO.Views.gameHome = Backbone.CompositeView.extend({
  template: JST["games/game_home"],

  initialize: function(options) {
    this.collection.each(this.addGameThumbnail.bind(this));
    this.listenTo(this.collection, "remove", this.removeGameThumbnail);
    this.listenTo(this.collection, "add", this.addGameThumbnail);
    // this.listenTo(this.collection, "sync", this.render);
    // this.listenTo(this.collection, "add", this.render);
    this.listenTo(this.collection, "sync", this.attachOrderedSubviews);
  },

  events: {
    "click .sidebar-list-item": "findGames",
  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  attachOrderedSubviews: function () {
    var models = this.collection.models.slice();
    this.collection.set([]);
    this.collection.set(models);
  },

  addGameThumbnail: function(game) {
    var view = new AGRO.Views.gameThumbnail({ model: game });
    this.addSubview('.game-thumbnails', view);
  },

  removeGameThumbnail: function (game) {
    this.removeModelSubview('.game-thumbnails', game);
  },

  findGames: function(event) {
    event.preventDefault();

    this.$(".chosen").removeClass("chosen").addClass("sidebar-list-item");

    var target = $(event.currentTarget);

    target.addClass("chosen").removeClass("sidebar-list-item");

    this._addPongy();
    // this.subviews(".game-thumbnails").each( function(view) { view.remove(); });

    this.collection.spinnerFetch({
      data: { console: target.data("console") },
    });

  },

  _addPongy: function() {
    var $pong = $("<div class='pong-loader'>");
    $("#pong-loader").html($pong);
  },

});
