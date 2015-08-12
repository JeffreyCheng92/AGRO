AGRO.Views.gameForm = Backbone.View.extend({
  template: JST["games/game_form"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "submit form": "sendForm"
  },

  render: function() {
    var header = (this.model.isNew()) ? "New Game" : "Edit Game";
    var button_name = (this.model.isNew()) ? "Add Game" : "Confirm Changes";
    var content = this.template({
      header: header,
      button_name: button_name,
      game: this.model,
    });

    this.$el.html(content);
    return this;
  },

  sendForm: function(event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    this.model.save(formData.game, {
      success: function() {
        this.hideErrors();
        this.collection.add(this.model);
        Backbone.history.navigate("", {trigger: true});
      }.bind(this),

      error: function(model, errors) {
        this.showErrors(errors);
      }.bind(this)
    });
  },

  showErrors: function(errors) {
    _.each(errors.responseJSON, function (error) {
        var controlGroup = this.$('.' + error.split(" ")[0].toLowerCase());
        controlGroup.addClass('error');
        controlGroup.find('.help-inline').text(error.split(" ")[0] + " cannot be blank.");
    }, this);
  },

  hideErrors: function () {
    this.$('.control-group').removeClass('error');
    this.$('.help-inline').text('');
  },

});
