AGRO.Views.navbarShow = Backbone.View.extend({
  template: JST["navbars/navbar"],

  initialize: function(options) {
    //put listeners in here
  },

  events: {
    "click .log-out": "logout",
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  logout: function(event) {
    event.preventDefault();

    $.ajax({
      url: '/session',
      method: 'DELETE',
      success: function(result) {
          window.location = "";
      }
    });
  }

});
