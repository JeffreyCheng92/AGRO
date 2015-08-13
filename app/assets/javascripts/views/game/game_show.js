AGRO.Views.gameShow = Backbone.CompositeView.extend({
  template: JST["games/game_show"],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  events: {
    "click .delete-button": "deleteGame"
  },

  render: function() {
    var id = (typeof current_user === "undefined") ? 0 : current_user.id;
    var content = this.template({ id: id, game: this.model });
    this.$el.html(content);

    if (this.model.covers().length > 0) {
      var cover = this.model.covers().last();
      //hard coding link to meet size criteria in show page
      var link = cover.get('url').split("ad/").join("ad/c_scale,h_400,w_350/");
      var $img = $('<img>').attr('src', link);
      this.$(".image-link").attr("href", "#/images/" + cover.id)
                           .html($img);
    } else {
      var linke = "http://res.cloudinary.com/jeffreycheng/image/upload/c_scale,h_400,w_350/v1439448506/Blank-Gray-Pic-03_skgolu.jpg";
      var $image = $('<img>').attr('src', linke);
      this.$(".image-link").html($image);
    }
    return this;
  },

  deleteGame: function(event) {
    event.preventDefault();

    this.model.destroy({
      success: function() {
        Backbone.history.navigate("", {trigger: true});
      },
      error: function(__, res) {
        window.location.assign("http://localhost:3000/session/new");
      }
    });
  },

});
