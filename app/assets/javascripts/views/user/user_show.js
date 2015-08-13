AGRO.Views.userShow = Backbone.View.extend({
  template: JST["users/user_show"],

  initialize: function(options) {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function() {
    var content = this.template({user: this.model});
    this.$el.html(content);
    if (this.model.keys().length > 1) {
      var avatar = this.model.avatar();
      //hard coding link to meet size criteria in profile page
      var link = avatar.get('url').split("ad/")
                       .join("ad/c_scale,h_400,w_350/");
      var $img = $('<img>').attr('src', link);
      this.$(".image-link").attr("href", "#/images/" + avatar.id)
                           .html($img);
    }
    return this;
  },

});
