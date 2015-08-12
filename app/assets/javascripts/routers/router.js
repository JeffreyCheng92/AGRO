AGRO.Routers.Router = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.games = options.games;
  },

  routes: {
    "": "gameIndex",
    "games/new": "gameNew",
    "games/search/:letter": "gameSearch",
    "games/:id": "gameShow",
    "games/:id/edit": "gameEdit",
    "users/:id": "userShow",
    "users/:id/edit": "userEdit"
  },

  gameIndex: function() {
    this.games.fetch();
    var gameIndexView = new AGRO.Views.gameIndex({collection: this.games});
    this._swapView(gameIndexView);
  },

  gameNew: function() {
    var game = new AGRO.Models.Game();
    var gameNewView = new AGRO.Views.gameForm({
      collection: this.games,
      model: game
    });
    this._swapView(gameNewView);
  },

  gameSearch: function(letter) {
    this.games.reset();
    this.games.fetch({ data: { letter: letter } });
    var gameLetterView = new AGRO.Views.gameIndex({collection: this.games});
    this._swapView(gameLetterView);
  },

  gameShow: function(id) {
    var game = this.games.getOrFetch(id);
    var gameShowView = new AGRO.Views.gameShow({ model: game });
    this._swapView(gameShowView);
  },

  gameEdit: function(id) {
    var game = this.games.getOrFetch(id);
    var gameEditView = new AGRO.Views.gameForm({
      collection: this.games,
      model: game
    });
    this._swapView(gameEditView);
  },

  userShow: function(id) {
    var user = this.users.getOrFetch(id);
    var userShowView = new AGRO.Views.userShow({model: user});
    this._swapView(userShowView);
  },

  userEdit: function(id) {
    var user = this.users.getOrFetch(id);
    var userEditView = new AGRO.Views.userEdit({
      model: user,
      collection: this.users
    });
    this._swapView(userEditView);
  },

  _swapView: function(view) {
    if (this._currentView) { this._currentView.remove(); }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
