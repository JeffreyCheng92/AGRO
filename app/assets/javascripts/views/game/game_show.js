AGRO.Views.gameShow = Backbone.CompositeView.extend({
  template: JST["games/game_show"],

  initialize: function(options) {
    this.reviews = options.reviews;
    this.reviews.each(this.addReviewItem.bind(this));
    this.addReviewForm();

    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.reviews, "sync remove add", this.render);
    this.listenTo(this.reviews, "add", this.addReviewItem);
  },

  events: {
    "click .delete-button": "deleteGame",
    "submit form": "addReview",
  },

  render: function() {
    var id = (typeof current_user === "undefined") ? 0 : current_user.id;
    var content = this.template({ id: id, game: this.model });
    this.$el.html(content);

    //hard coding image into page
    if (this.model.cover().has("id")) {
      var cover = this.model.cover();
      //hard coding link to meet size criteria in show page
      var link = cover.get('url').split("ad/").join("ad/c_scale,h_400,w_350/");
      var $img = $('<img>').attr('src', link);
      this.$(".image-link").attr("href", "#/images/" + cover.id)
                           .html($img);
    }

    this.attachSubviews();
    if (this.$('#star-rate').children().length > 6) {
      this.$('#star-rate').children().last().remove();
    }
    return this;
  },

  addReviewItem: function(item) {
    var view = new AGRO.Views.reviewItem({ model: item });
    this.addSubview('.review-list', view);
  },

  addReviewForm: function() {
    var form = new AGRO.Views.reviewForm();
    this.addSubview('.review-form', form);
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


  addReview: function(event) {
    event.preventDefault();
    var review = new AGRO.Models.Review();
    var formData = $(event.currentTarget).serializeJSON();
    formData.review.author_id = current_user.id;
    formData.review.game_id = this.model.id;
    review.save(formData.review, {
      success: function() {
        this.reviews.add(review);
        //
        //on navigate, it only renders the body correction but not the username
        // seems i need to visit another game before it resets
        // Backbone.history.navigate("#/games/" + this.model.id, {trigger: true});
        Backbone.history.navigate("", {trigger: true});
      }.bind(this),
      error: function(_, response) {
        debugger
      }
    });

  }

});
