AGRO.Views.navbarShow = Backbone.View.extend({
  template: JST["navbars/navbar"],

  initialize: function(options) {
    //put listeners in here
    // $('.navbar-search').on('submit', '.typeahead', this.search.bind(this));
  },

  events: {
    "click .log-out": "logout",
    "submit .navbar-search": "search",
    "blur .typeahead": "emptySearchField",
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  onRender: function() {
    $('.typeahead').typeahead('destroy');
    $('.typeahead').typeahead();
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
  },

  emptySearchField: function(event) {
    $(event.currentTarget).val("");
  },

  search: function(event) {
    event.preventDefault();

    var queryString = this.$('.typeahead').val();
    queryString = queryString.replace(" ", "+");
    this.$('.typeahead').val("");

    Backbone.history.navigate("/search/" + queryString, {trigger: true});
  }

});
