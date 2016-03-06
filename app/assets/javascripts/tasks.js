$(document).on("focus", ".address-lookup", function() {
  return $(".address-lookup").autocomplete({source: "/search/location.json"}).css("position", "static");
});
