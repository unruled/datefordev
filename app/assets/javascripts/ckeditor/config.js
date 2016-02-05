if(typeof(CKEDITOR) != 'undefined')
{
// see https://rjsteen.wordpress.com/2014/01/06/media-embedding-with-ckeditor-rails-4-0/
   CKEDITOR.config.extraPlugins = 'youtube';
   
// uncomment to see the color changed for toolbar as the indication that this JS works
//CKEDITOR.config.uiColor = "#AADC6E";

   CKEDITOR.config.toolbar_dateprog = [
//['Source', 'Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
['Source', 'Undo','Redo','RemoveFormat'],
['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
['NumberedList','BulletedList','-','Outdent','Indent'],
['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
['Link','Unlink', 'Youtube'],
['Image','Table','HorizontalRule'],
['Styles','Format','Font','FontSize'],
['TextColor','BGColor'] 
];

} else{
  console.log("ckeditor not loaded")
}





