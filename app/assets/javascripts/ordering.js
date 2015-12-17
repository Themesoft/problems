
// form: the main form that holds all the Attachments
// fieldname: hidden field to store the position
var OrderAttachments = function(mainForm, orderField) {
  this.orderField = orderField;
  this.mainForm = mainForm;

  this.order = function() {
    var orderField = this.mainForm.find("[name='" + orderField + "']");
    orderField.each(function(item, index, arr) {
      $(item).val(index);
    });
}

// mainForm: the master form. This is the root of the query
// orderform: the hidden form that contaitns the order of the subforms
// identifier: the HTML attribute that holds the ID for ordering
var OrderMain = function(mainform, orderField, identifier) {
  this.identifier = sectionsID;
  this.orderField = orderField;
  this.mainform = mainform;

  this.order = function() {
    var sections = mainForm.find('[' + this.identifier + ']');
    var positionString = "";

    sections.forEach(function(item, index, arr) {
      var id = item.attr(identifier);
        positionString += id;
    });

    this.orderField.val(poistionString);
  }
}
