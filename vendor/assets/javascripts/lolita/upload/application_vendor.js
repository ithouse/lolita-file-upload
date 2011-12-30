//= require jquery-ui
//= require lolita/upload/plupload.full
//= require lolita/upload/jquery.ui.plupload
//= require_self

// $("#filelist .file-item .window").height(function(index, height){
//   return ($("#content").width() - 10) * 0.3;
// })
//
$(".file-editor .save").live("click", function() {
  $(this).closest("form").submit();
  return false;
})
