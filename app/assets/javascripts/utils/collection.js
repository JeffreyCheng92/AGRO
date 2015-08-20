_.extend(Backbone.Collection.prototype, {
  spinnerFetch: function (options) {
    var modifiedOptions = _.extend(options, {
      success: function (model, response, XHR) {
        debugger
        $("#pong-loader").empty();
        options.success && options.success(model, response, XHR);
      },
      error: function (XHR, response, status) {
        $("#pong-loader").empty();
        options.error && options.error(XHR, response, status);
      }
    });
    debugger
    return this.fetch(modifiedOptions);
  }
});
