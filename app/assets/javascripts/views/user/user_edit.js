AGRO.Views.userEdit = Backbone.View.extend({
  template: JST["users/user_edit"],

  events:{
    "submit form": "updateUser",
    "click .upload-button": "upload"
  },

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
    this.images = options.images;
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
        Backbone.history.navigate("#/users/" + this.model.id, {trigger: true});
      }.bind(this),
      error: function() {
        window.location.replace("http://localhost:3000/session/new");
      }
    });
  },

  upload: function(event) {
    event.preventDefault();
    var image = new AGRO.Models.Image();
    debugger

    cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result) {
      if (error === null ) {
        this.$('.help-inline').html("");
        var data = result[0];
        var formData = { url: data.url,
                         thumbnail_url: data.thumbnail_url,
                         imageable_id: current_user.id,
                         imageable_type: "User"
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
