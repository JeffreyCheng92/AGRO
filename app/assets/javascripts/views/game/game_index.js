AGRO.Views.gameIndex = Backbone.CompositeView.extend({
  template: JST["games/game_index"],

  initialize: function(options) {
    this.listenTo(this.collection, "add", this.addGameListItem);
    this.listenTo(this.collection, "remove", this.removeGameListItem);
    this.listenTo(this.collection, "sync", this.render);

    this.addAlphaBar();
    this.collection.each(this.addGameListItem.bind(this));
  },

  removeGameListItem: function (game) {
    this.removeModelSubview('.games-table', game);
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
    this.addSubview('.games-table', view);
  },

  search: function(event) {
    event.preventDefault();
    // Remove current selected letter in alphabet bar
    this.$(".selected").removeClass("selected");

    var target = $(event.currentTarget);
    // Add red bg to newly selected in alphabet bar
    target.addClass("selected");

    // Removes the subviews manually in games list preserving alphabet bar
    this.subviews(".game-list").each( function(view) { view.remove(); });

    // Setting the subview hash object to empty to prevent persisting views
    // from rerendering.
    // this._subviews[".game-list"] = _([]);
    this.collection.fetch({
      data: { letter: target.data("letter") }
    });
  },

});
