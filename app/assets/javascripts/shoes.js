// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.onreadystatechange = () => {
  if (document.readyState === 'complete') {
    // document ready
    document.getElementById("uploadBtn").onchange = function () {
      document.getElementById("uploadFile").value = this.files[0].name;
    };
    //$('#shoes_list_table').DataTable();
    
  }
};

$(document).ready(function() {
  $('#test_table').DataTable();  
} );
