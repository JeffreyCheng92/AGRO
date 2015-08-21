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
    var formData = this.$(".contact-form").serializeJSON();

    if (formData.contact.email.length < 4) {
      this.$(".help-inline.email").html("Please enter valid email.");
    }
    if (formData.contact.feedback.length < 10) {
      this.$(".help-inline.feedback").html("Please write candid feedback.");
    }

    $.ajax({
      url: '/api/mails',
      dataType: 'json',
      method: 'POST',
      data: {data: formData.contact},
      success: function() {
        this.$(".help-inline").empty();
        this.$("input").val("");
        this.$("textarea").val("");
      }.bind(this)
    });
  }

});
