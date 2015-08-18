window.AGRO = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new AGRO.Routers.Router({
      $rootEl: $("#content"),
      users: new AGRO.Collections.Users(),
      games: new AGRO.Collections.Games(),
      images: new AGRO.Collections.Images(),
      reviews: new AGRO.Collections.Reviews(),
      consoles: new AGRO.Collections.Consoles(),
    });
    Backbone.history.start();

    var navbar_view = new AGRO.Views.navbarShow();
    $("#navbar").html(navbar_view.render().$el);

    $(".navlink").on('click', function(event) {
      var link = $(event.currentTarget).attr('href');
      Backbone.history.navigate('.');
      Backbone.history.navigate(link, { trigger: true });
    });
  }
};
