AGRO.Routers.Router = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.users = options.users;
    this.games = options.games;
    this.images = options.images;
    this.reviews = options.reviews;
    this.consoles = options.consoles;
    this.tags = options.tags;
  },

  routes: {
    "": "home",
    "fakey-mcfakerson": "fakeyMcFakerson",
    "games": "gameIndex",
    "games/new": "gameNew",
    "games/:id": "gameShow",
    "games/:id/edit": "gameEdit",
    "users/:id": "userShow",
    "users/:id/edit": "userEdit",
    "images/:id": "imageShow",
    "consoles/:id": "consoleShow",
    "about": "aboutShow",
    "search/:query": "search",
    "tags/:id": "tagShow",
  },

  fakeyMcFakerson: function () {
    return false;
  },

  search: function(query) {
    this._addPongy();
    this.games.spinnerFetch({ data: { query: query }});
    this._addPongy();
    this.tags.spinnerFetch({ data: { query: query } });
    var searchView = new AGRO.Views.searchIndex({
      tags: this.tags,
      games: this.games
    });
    this._swapView(searchView);
  },

  gameIndex: function() {
    this._addPongy();
    this.games.spinnerFetch();
    var gameIndexView = new AGRO.Views.gameIndex({ collection: this.games });
    this._swapView(gameIndexView);
  },

  home: function() {
    this._addPongy();
    this.games.spinnerFetch({ data: { top: true }});
    var gameHomeView = new AGRO.Views.gameHome({ collection: this.games });
    this._swapView(gameHomeView);
  },

  gameNew: function() {
    var game = new AGRO.Models.Game();
    var gameNewView = new AGRO.Views.gameForm({
      collection: this.games,
      model: game,
      images: this.images,
    });
    this._swapView(gameNewView);
  },

  gameShow: function(id) {
    var game = this.games.getOrFetch(id);
    var gameShowView = new AGRO.Views.gameShow({
      model: game,
      reviews: game.reviews(),
     });
    this._swapView(gameShowView);
  },

  gameEdit: function(id) {
    var game = this.games.getOrFetch(id);
    var gameEditView = new AGRO.Views.gameForm({
      collection: this.games,
      model: game,
      images: this.images,
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
      collection: this.users,
      images: this.images,
    });
    this._swapView(userEditView);
  },

  // imageShow: function(id) {
  //   var image = this.images.getOrFetch(id);
  //   var view = new AGRO.Views.imagesShow({ model: image });
  //   this._swapView(image);
  // },

  consoleShow: function(id){
    var consoul = this.consoles.getOrFetch(id);
    var view = new AGRO.Views.consoleShow({ model: consoul });
    this._swapView(view);
  },

  aboutShow: function() {
    var aboutView = new AGRO.Views.aboutShow();
    this._swapView(aboutView);
  },

  tagShow: function(id) {
    var tag = this.tags.getOrFetch(id);
    var tagShowView = new AGRO.Views.tagShow({ model: tag });
    this._swapView(tagShowView);
  },

  _swapView: function(view) {
    $(document.body).removeClass().addClass("mario");
    $('body').scrollTop(0);
    // $(".main-body").css("height", "inherit");
    if (this._currentView) { this._currentView.remove(); }
    this._currentView = view;
    this.$rootEl.html(view.$el);
    view.render();
  },

  _addPongy: function() {
    var $pong = $("<div class='pong-loader'>");
    $("#pong-loader").html($pong);
  },

});
