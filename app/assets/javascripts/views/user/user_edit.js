AGRO.Views.userEdit = Backbone.View.extend({
  template: JST["users/user_edit"],

  events:{
    "submit form": "updateUser",
    "click .upload-button": "upload"
  },

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    return this;
  },

  updateUser: function(event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    this.model.save(formData.user, {
      success: function() {
        this.collection.add(this.model);

        var image = this.model.avatar();
        image.save(this.formData, {});

        Backbone.history.navigate("#/users/" + this.model.id, {trigger: true});
      }.bind(this),
      error: function() {
        window.location.replace("http://localhost:3000/session/new");
      }
    });
  },

  upload: function(event) {
    event.preventDefault();

    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      if (error === null ) {
        this.$('.help-inline').html("");
        var data = result[0];
        this.formData = { url: data.url,
                          thumbnail_url: data.thumbnail_url,
                          imageable_id: current_user.id,
                          imageable_type: "User"
                        };

        this.$(".upload-button").html("success")
                                .removeClass("btn-default")
                                .addClass("btn-success");
        this.$(".filename")
            .html(data.original_filename.substring(0, 10) + "...");
      } else {
        this.$('.help-inline').html("Image upload failed");
      }
    }.bind(this));
  }

});
