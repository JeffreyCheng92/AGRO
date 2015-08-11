AGRO.Views.userEdit = Backbone.View.extend({
  template: JST["users/user_edit"],

  events:{
    "submit form": "updateUser"
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
      }.bind(this)
    });
  }

});
