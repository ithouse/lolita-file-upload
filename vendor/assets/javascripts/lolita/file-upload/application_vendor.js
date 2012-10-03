//= require jquery-ui
//= require lolita/file-upload/plupload.full
//= require lolita/file-upload/jquery.ui.plupload
//= require lolita/file-upload/jquery.easing.1.3
//= require lolita/file-upload/jquery.elastislide

$(document).ready(function(){
  $(document).on("click", ".file-editor a.save", function(event) {
    $(this).closest("form").submit();
    return false;
  });
});

