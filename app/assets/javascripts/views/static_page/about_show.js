AGRO.Views.aboutShow = Backbone.View.extend({
  template: JST["static_pages/about_show"],

  events: {
    "click .contact": "sendMail"
  },

  render: function() {
    this.$el.html(this.template());
    return this;
  },

  sendMail: function(event) {
    event.preventDefault();
    debugger
    var formData = this.$(".contact-form").serializeJSON();

    $.ajax({
      url: '/api/mails',
      dataType: 'json',
      method: 'POST',
      data: {data: formData.contact},
    });
  }

});
