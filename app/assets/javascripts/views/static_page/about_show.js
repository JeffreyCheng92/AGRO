AGRO.Views.aboutShow = Backbone.View.extend({
  template: JST["static_pages/about_show"],

  render: function() {
    this.$el.html(this.template());
    return this;
  }

});
