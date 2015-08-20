AGRO.Views.gameListItem = Backbone.View.extend({
  template: JST["games/game_list_item"],
  tagName: "tr",
  className: 'game-list-item',

  initialize: function (options) {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click td": "goToGame",
  },

  render: function () {
    var content = this.template({game: this.model});
    this.$el.html(content);
    this.onRender();
    return this;
  },

  onRender: function() {
    var view = this;
    this.$('.star-rating').raty('destroy');
    this.$('.star-rating').raty({
      path: '/assets/',
      half: true,
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
  },

  goToGame: function(event) {
    event.preventDefault();
    Backbone.history.navigate("games/" + this.model.get('id'),
                               { trigger: true });
  }

});
