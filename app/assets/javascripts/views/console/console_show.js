AGRO.Views.consoleShow = Backbone.CompositeView.extend({
  template: JST['consoles/console_show'],

  initialize: function(options) {
    this.addAlphaBar();
    this.listenTo(this.model, 'sync', this.gameListRender);
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.games(), 'remove', this.removeGameListItem);
  },

  events: {
    "click .letter-link": "search",
  },

  render: function() {
    $(".main-body").css("background", "rgba(255, 255, 255, 0.2)");
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

  search: function(event) {
    event.preventDefault();

    this.model.games().each( this.removeGameListItem.bind(this) );
    // Remove current selected letter in alphabet bar
    this.$(".selected").removeClass("selected").addClass("letter-link");

    var target = $(event.currentTarget);
    // Add red bg to newly selected in alphabet bar
    target.addClass("selected").removeClass("letter-link");

    // Removes the subviews manually in games list preserving alphabet bar
    this.subviews(".games-table").each( function(view) {
      view.remove();
    }.bind(this));

    // Setting the subview hash object to empty to prevent persisting views
    // from rerendering.
    this.model.fetch({
      data: { letter: target.data("letter") }
    });
  },

  removeGameListItem: function (game) {
    this.removeModelSubview('.games-table', game);
  },

});
