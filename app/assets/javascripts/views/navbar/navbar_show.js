AGRO.Views.navbarShow = Backbone.View.extend({
  template: JST["navbars/navbar"],

  initialize: function(options) {
    //put listeners in here
  },

  events: {
    "click .log-out": "logout",
    "submit .navbar-search": "search",
    "blur .typeahead": "emptySearchField",
    "click .typeahead": "addUserTopic",
  },

  render: function() {
    this.$el.html(this.template());
    this.onRender();
    return this;
  },

  onRender: function() {
    this.$('.typeahead').typeahead({
      hint: true,
      highlight: true,
      minLength: 3,
      limit: 7
    },
    {
      name: 'availableTopics',
      source: this.typeaheadSource,
      async: true,
      limit: 10,
    });
  },

  typeaheadSource: function(query, sync, async) {
    var args = arguments;
    $.ajax({
      url: '/api/games',
      dataType: 'json',
      data: {query: query},
      success: function(data) {
        var titles = _.map(data, function(object) {
          return object.title;
        });
        // console.log(args);
        async(titles);
      }
    });
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
    this.$('.typeahead').typeahead('close');
    var queryString = this.$('.tt-input').val();
    queryString = queryString.replace(" ", "+");
    this.$('.typeahead').val("");

    Backbone.history.navigate("/search/" + queryString, {trigger: true});
  }
});
