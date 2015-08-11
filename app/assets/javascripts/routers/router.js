AGRO.Routers.Router = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.games = options.games;
  },

  routes: {
    "": "gameIndex",
    "games/new": "gameNew",

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
