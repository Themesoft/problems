
// Organizers the elements with the identifier inside the surroudning form
// surroundingForm: the parent class that holds all the forms
// orderform: the hidden field that stores the order
// identifier: the HTML attribute that holds the moveable object
var Organzier = function(surroundingForm, orderField, identifier) {
  this.identifier = identifier;
  this.orderField = $(orderField);
  this.surroundingForm = $(surroundingForm);

  this.order = function() {
    var sections = surroundingForm.find('[' + this.identifier + ']');
    var positionString = "";

    sections.forEach(function(item, index, arr) {
      var id = item.attr(identifier);
        positionString += id;
    });

    this.orderField.val(poistionString);
  }
}
