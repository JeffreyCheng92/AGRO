AGRO.Views.gameShow = Backbone.View.extend({
  template: JST["games/game_show"],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    "click .delete-button": "deleteGame"
  },

  render: function() {
    var content = this.template({ game: this.model });
    this.$el.html(content);
    return this;
  },

  deleteGame: function(event) {
    event.preventDefault();

    this.model.destroy({
      success: function() {
        Backbone.history.navigate("", {trigger: true});
      },
      error: function(__, res) {
        window.location.assign("http://localhost:3000/session/new");
      }
    });
  },

});
