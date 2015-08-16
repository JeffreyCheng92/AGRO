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

    $(".all-games").on('click', function(event) {
      Backbone.history.navigate('.');
      Backbone.history.navigate('/', { trigger: true });
    });
  }
};

$(document).ready(function(){
  AGRO.initialize();
});
