AGRO.Views.gameHome = Backbone.CompositeView.extend({
  template: JST["games/game_home"],

  initialize: function(options) {
    this.listenTo(this.collection, "add", this.addGameThumbnail);
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.render);
  },

  events: {

  },

  render: function() {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addGameThumbnail: function(game) {
    var view = new AGRO.Views.gameThumbnail({ model: game });
    this.addSubview('.game-thumbnails', view);
  },

});
