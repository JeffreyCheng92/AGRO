AGRO.Views.consoleShow = Backbone.CompositeView.extend({
  template: JST['consoles/console_show'],

  initialize: function(options) {
    this.addAlphaBar();
    this.listenTo(this.model, 'sync', this.gameListRender);
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({ consoul: this.model });
    this.$el.html(content);
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

  gameListRender: function() {
    this.model.games().each( function(game) {
      var view = new AGRO.Views.gameListItem({ model: game });
      this.addSubview('.games-table', view);
    }.bind(this));
  },

});
