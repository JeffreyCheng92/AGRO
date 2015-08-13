AGRO.Views.gameForm = Backbone.View.extend({
  template: JST["games/game_form"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
    this.images = options.images;
  },

  events: {
    "submit form": "sendForm",
    "click .upload-button": "upload"
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

  upload: function(event) {
    event.preventDefault();
    var image = new AGRO.Models.Image();

    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      if (error === null) {
        this.$('.help-inline').html("");
        var data = result[0];
        var formData = { url: data.url,
                         thumbnail_url: data.thumbnail_url,
                         imageable_id: this.model.id,
                         imageable_type: "Game"
                       };
        image.save(formData, {
          success: function() { this.images.add(image); }.bind(this)
        });
      } else {
        this.$('.help-inline').html("Image upload failed");
      }
    }.bind(this));
  }

});
