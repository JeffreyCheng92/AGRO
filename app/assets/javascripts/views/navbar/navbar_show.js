AGRO.Views.navbarShow = Backbone.View.extend({
  template: JST["navbars/navbar"],

  events: {
    "click .log-out": "logout",
    "submit .navbar-search": "search",
    // "blur .typeahead": "emptySearchField",
    // "click .typeahead": "addUserTopic",
    "click .navlink": "navigate"
  },

  render: function() {
    this.$el.html(this.template());
    this.onRender();
    return this;
  },

  onRender: function() {
    this.$('.typeahead').typeahead({
      hint: false,
      highlight: true,
      minLength: 3,
    },
    {
      name: 'availableTopics',
      source: this.typeaheadSource,
      async: true,
      limit: 10,
    });
  },

  typeaheadSource: function(query, sync, async) {
    $.ajax({
      url: '/api/games',
      dataType: 'json',
      data: {query: query},
      success: function(data) {
        var titles = _.map(data, function(object) {
          return object.title;
        });
        async(titles);
      }
    });
    $.ajax({
      url: '/api/tags',
      dataType: 'json',
      data: {query: query},
      success: function(data) {
        var labels = _.map(data, function(object) {
          return object.label;
        });
        async(labels);
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

  navigate: function (event) {
    event.preventDefault();
    var link = $(event.currentTarget).attr('href');
    Backbone.history.navigate('fakey-mcfakerson');
    Backbone.history.navigate(link, { trigger: true });
  },

  // emptySearchField: function(event) {
  //   $(event.currentTarget).val("");
  // },

  search: function(event) {
    event.preventDefault();
    this.$('.typeahead').typeahead('close');
    var queryString = this.$('.tt-input').val();
    queryString = queryString.replace(" ", "+");
    this.$('.typeahead').val("");

    Backbone.history.navigate("/search/" + queryString, {trigger: true});
  }
});
