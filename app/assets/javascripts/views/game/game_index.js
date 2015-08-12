AGRO.Views.gameIndex = Backbone.CompositeView.extend({
  template: JST["games/game_index"],

  initialize: function(options) {
    this.listenTo(this.collection, "sync remove", this.render);
    this.listenTo(this.collection, "add", this.addGameListItem);
    this.addAlphaBar();
    this.collection.each(this.addGameListItem.bind(this));
  },

  events: {
    "click .letter-link": "search",
  },

  render: function () {
    this.$el.html(this.template());
    this.attachSubviews();
    return this;
  },

  addAlphaBar: function() {
    var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("");
    alphabet.forEach( function(letter) {
      var view = new AGRO.Views.gameIndexLetter({letter: letter});
      this.addSubview('.alphabet', view);
    }.bind(this));
  },

  addGameListItem: function(game) {
    var view = new AGRO.Views.gameListItem({ model: game });
    this.addSubview('.game-list', view);
  },

  search: function(event) {
    event.preventDefault();
    debugger
    this.$(".selected").removeClass("selected");
    var target = $(event.currentTarget);
    var url = target.data('link');
    Backbone.history.navigate(url, {trigger: true});
    target.addClass("selected");
  },

});
