AGRO.Views.reviewItem = Backbone.View.extend({
  template: JST['reviews/review_item'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync change:num_votes', this.render);
    this.listenTo(this.model.like(), 'change add', this.render);
  },

  events: {
    'click .edit-review': 'editReview',
    'click .delete-review': 'deleteReview',
    'click .upvote': 'upvote',
    'click .downvote': 'downvote',
  },

  render: function() {
    var id = (typeof current_user === "undefined") ? 0 : current_user.id;

    var content = this.template({
      id: id,
      review: this.model
    });
    this.$el.html(content);
    this.onRender();
    this.voteOnRender();
    return this;
  },

  onRender: function() {
    var view = this;
    this.$('.star-rating').raty('destroy');
    this.$('.star-rating').raty({
      path: '/assets/',
      half: true,
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
  },

  voteOnRender: function() {
    this.$(".btn-warning")
        .removeClass("btn-warning").addClass("btn-default");
    if (this.model.isUpvoted() && !this.model.like().isNew()) {
      this.$(".upvote").removeClass("btn-default").addClass("btn-warning");
    } else if (this.model.isDownvoted() && !this.model.like().isNew()) {
      this.$(".downvote").removeClass("btn-default").addClass("btn-warning");
    }
  },

  upvote: function(event) {
    event.preventDefault();
    if (this.model.isVoted()) {
      // if already upvoted
      if (this.model.isUpvoted()) {
        this.model.destroy_like();
        this.model.set({num_votes: this.model.get('num_votes') - 1});
      } else { // if currently downvoted
        this.model.destroy_like();
        this.model.like().save({review_id: this.model.id, value: 1});
        this.model.set({num_votes: this.model.get('num_votes') + 2});
      }
    } else {
      // target.removeClass("btn-default").addClass("btn-warning");
      this.model.like().save({review_id: this.model.id, value: 1});
      this.model.set({num_votes: this.model.get('num_votes') + 1});
    }
  },

  downvote: function(event) {
    event.preventDefault();
    if (this.model.isVoted()) {
      if (this.model.isUpvoted()) {
        this.model.destroy_like();
        this.model.like().save({review_id: this.model.id, value: -1});
        this.model.set({num_votes: this.model.get('num_votes') - 2});
      } else { // if already downvoted
        this.model.destroy_like();
        this.model.set({num_votes: this.model.get('num_votes') + 1});
      }
    } else {
      this.model.like().save({review_id: this.model.id, value: -1});
      this.model.set({num_votes: this.model.get('num_votes') - 1});
    }
  },

  editReview: function(event) {
    event.preventDefault();
    var editView = new AGRO.Views.reviewEdit({
      model: this.model,
    });

    $('body').append(editView.$el);
    editView.render();
  },

  deleteReview: function(event) {
    event.preventDefault();

    this.model.destroy();
    Backbone.history
    .navigate("#/games/" + this.model.get('game').id, { trigger: true });
  },


});
