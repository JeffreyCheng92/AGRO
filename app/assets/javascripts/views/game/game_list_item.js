TrelloClone.Views.gameListItem = Backbone.View.extend({
  template: JST["games/game_list_item"],

  initialize: function (options) {
  },

  render: function () {
    var content = this.template({game: this.model});
    this.$el.html(content);
    return this;
  },
});
