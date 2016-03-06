var load_javascript, main;

main = function() {
  return load_javascript($("body").data('controller'), $("body").data('action'));
};

$(document).ready(main);

$(document).on('page:load', main);

load_javascript = function(controller, action) {
  $.event.trigger(controller + ".load");
  return $.event.trigger(action + "_" + controller + ".load");
};
