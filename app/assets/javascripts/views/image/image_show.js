AGRO.Views.ImagesShow = Backbone.View.extend({
  template: JST['images/image_show'],

  initialize: function(options){
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    this.$el.html(this.template({image: this.model}));
    return this;
  },


});
