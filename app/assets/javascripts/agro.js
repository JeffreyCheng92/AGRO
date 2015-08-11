window.AGRO = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new AGRO.Routers.Router({
      $rootEl: $("#content"),
      users: new AGRO.Collections.Users()
    });
    Backbone.history.start();
  }
};

$(document).ready(function(){
  AGRO.initialize();
});
