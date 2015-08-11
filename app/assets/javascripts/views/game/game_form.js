AGRO.Views.boardForm = Backbone.View.extend({
  template: JST["games/game_form"],

  initialize: function(options) {

  },

  events: {
    "submit form": "sendForm"
  },

  render: function() {
    var header = (this.model.isNew()) ? "New Game" : "Edit Game?";
    var button_name = (this.model.isNew()) ? "Add Game" : "Confirm Changes";
    this.$el.html(this.template({
      header: header,
      button_name: button_name,
      board: this.model
    }));
    return this;
  },

  sendForm: function(event) {
    event.preventDefault();

    var formData = $(event.currentTarget).serializeJSON();

    this.model.save(formData.game, {
      success: function() {
        this.collection.add(this.model);
        Backbone.history.navigate("#/game/" + this.model.id);
      }.bind(this)
    });
  }
});
