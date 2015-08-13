AGRO.Views.ImagesShow = Backbone.View.extend({
  template: JST['images/image_show'],

  initialize: function(options){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    var content = this.template({ image: this.model });
    this.$el.html(content);
    return this;
  },


});
