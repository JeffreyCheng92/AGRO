AGRO.Routers.Router = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
    this.users = options.users;
  },

  routes: {
    "users/:id": "userShow",
  },

  userShow: function(id) {
    var user = this.users.getOrFetch(id);
    var userShowView = new AGRO.Views.userShow({model: user});
    this._swapView(userShowView);
  },

  _swapView: function(view) {
    if (this._currentView) { this._currentView.remove(); }
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }

});
