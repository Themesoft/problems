$(document).ready(function() {
  var orderString = "";
  var formIDs = $('[movement]');
  formIDs.forEach(function(item) {
    orderString += item.attr('movement');
  });
  $('#formOrder').val(orderString);
});
