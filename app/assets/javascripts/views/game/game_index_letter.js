AGRO.Views.gameIndexLetter = Backbone.View.extend({
  template: JST["games/game_index_letter"],

  initialize: function(options) {
    this.letter = options.letter;
  },

  render: function(options) {
    var content = this.template({ letter: this.letter });
    this.$el.html(content);
    return this;
  },

});
