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

    $(".navlink").on('click', function(event) {
      var link = $(event.currentTarget).attr('href');
      Backbone.history.navigate('.');
      Backbone.history.navigate(link, { trigger: true });
    });

    $(".guest").on('click', function(event) {
      event.preventDefault();
      $("#users-username").val("guest");
      $("#users-password").val("123123");
      $(".login").trigger("click");
    });
  }
};

$(document).ready(function(){
  AGRO.initialize();
});
