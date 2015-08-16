AGRO.Views.gameForm = Backbone.View.extend({
  template: JST["games/game_form"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
  },

  CONSOLES: ["Gameboy", "Gameboy Color", "Gameboy Advance", "Gamecube", "iOS",
              "Nintendo64", "NintendoDS", "Nintendo3DS", "PC", "PlayStation",
              "PS-2", "PS-3", "PS-4", "PS-P", "VITA", "XBox", "XBox360", "XBoxOne", "Wii", "Wii U"],

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
    this.onRender();
    return this;
  },

  onRender: function() {
    this.CONSOLES.forEach( function(consoul, index) {
      var $p = $('<p>');
      var $label = $('<label>').html(consoul);
      var $input = $('<input>').attr('type', 'checkbox')
                             .attr('name', "game[console_ids][]")
                             .attr('value', index + 1);
      if (this.model) {
        var consoles = [];
        this.model.consoles().forEach( function(con) {
          consoles.push(con.get('id')) ;
        });

        consoles.forEach(function(id) {
          if (id === index + 1) {
            $input.attr("checked", "checked");
          }
        });
      }

      var content = $p.append($input).append($label);

      if (index < 5) {
        this.$('.first-column').append(content);
      } else if (index < 10) {
        this.$('.second-column').append(content);
      } else if (index < 15) {
        this.$('.third-column').append(content);
      } else if (index < 20) {
        this.$('.fourth-column').append(content);
      }

    }.bind(this));
  },

  sendForm: function(event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();

    this.model.save(formData.game, {
      success: function() {
        this.hideErrors();
        this.collection.add(this.model);
        var image = this.model.cover();



        if (typeof this.formData !== 'undefined') {
          // this.formData.imageable_id =  this.model.id;
          image.save(this.formData, {
            success: function (image, rep) {
              // debugger;
            }.bind(this),
            error: function (image, resp) {
              // debugger;
            }.bind(this)
          } );
        }
        Backbone.history.navigate("/games/" + this.model.id, {trigger: true});
      }.bind(this),

      error: function(model, errors) {
        this.showErrors(errors);
      }.bind(this)
    });
  },

  showErrors: function(errors) {
    _.each(errors.responseJSON, function (error) {
        var field = error.split(" ")[0].toLowerCase();
        var controlGroup = this.$('.' + field);
        controlGroup.addClass('error');
        if (field === 'title') {
          controlGroup.find('.help-inline').text(error.split(" ")[0] + " cannot be blank or already taken.");
        } else {
          controlGroup.find('.help-inline').text(error.split(" ")[0] + " cannot be blank.");
        }
    }, this);
  },

  hideErrors: function () {
    this.$('.control-group').removeClass('error');
    this.$('.help-inline').text('');
  },

  upload: function(event) {
    event.preventDefault();
    // var image = new AGRO.Models.Image();
    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      if (error === null) {
        this.$('.help-inline').html("");
        var data = result[0];
        this.formData = { url: data.url,
                         thumbnail_url: data.thumbnail_url,
                         imageable_type: "Game",
                        //  cant do this because this.model is new
                        //  imageable_id: this.model.id
                        // but this.model can be saved and can add after
                       };

      } else {
        this.$('.help-inline-image').html("Image upload failed");
      }
    }.bind(this));
  }

});
