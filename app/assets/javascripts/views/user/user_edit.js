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
        Backbone.history.navigate("#/users/" + this.model.id, {trigger: true});
      }.bind(this),
      error: function() {
        window.location.replace("http://localhost:3000/session/new");
      }
    });
  },

  upload: function(event) {
    event.preventDefault();
    var image = new CloudinaryDemo.Models.Image();

    // cloudinary.openUploadWidget(CLOUDINARY_OPTIONS, function(error, result){
    //   var data = result[0];
    //   image.set({url: data.url, thumb_url: data.thumbnail_url});
    //   image.save({}, {
    //     success: function(){
    //       CloudinaryDemo.Collections.images.add(image);
    //     }
    //   });
    // });
  }

});
