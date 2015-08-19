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
    "click .back": "back",
  },

  render: function() {
    var id = (typeof current_user === "undefined") ? 0 : current_user.id;
    var content = this.template({ id: id, game: this.model });
    this.$el.html(content);
    this.imageHelper();


    this.attachSubviews();
    this.onRender();
    this.starOnRender();
    return this;
  },

  starOnRender: function() {
    var view = this;
    this.$('.game-avg-rating').raty('destroy');
    this.$('.game-avg-rating').raty({
      path: '/assets/',
      half: true,
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
  },

  addReviewItem: function(item) {
    var view = new AGRO.Views.reviewItem({ model: item });
    this.addSubview('.review-list', view);
  },

  addReviewForm: function() {
    var form = new AGRO.Views.reviewForm({
      collection: this.reviews,
      model: new AGRO.Models.Review({
        game_id: this.model.id
      })
    });
    this.addSubview('.review-form', form);
  },

  back: function(event) {
    event.preventDefault();
    window.history.back();
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

  imageHelper: function() {
    //hard coding image into page
    if (this.model.cover().has("id")) {
      var cover = this.model.cover();
      //hard coding link to meet size criteria in show page
      var link = cover.get('url').split("ad/").join("ad/c_scale,h_400,w_350/");
      var $img = $('<img>').attr('src', link);
      this.$(".image-link").attr("href", "#/images/" + cover.id)
                           .html($img);
    }
  },
});
