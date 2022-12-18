// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"
// import "popper"
// import "bootstrap"

//= require jquery 
//= require jquery_ujs 

$(document).ready(function(){

$(".cls_cat_question input").on('click',function(){
  var _parent=$(this);
  var nextli=$(this).parent().next().children().children();
  
  if(_parent.prop('checked')){
     console.log('parent checked');
     nextli.each(function(){
       $(this).children().prop('checked',true);
     });
    
  }
  else{
    console.log('parent un checked');
     nextli.each(function(){
       $(this).children().prop('checked',false);
     });
  
  }
});

$(".cls_question input").on('click',function(){
  
  var ths=$(this);
  var parentinput=ths.closest('div').prev().children();
  var sibblingsli=ths.closest('ul').find('li');
  
  if(ths.prop('checked')){
    console.log('child checked');
    parentinput.prop('checked',true);
  }
  else{
    console.log('child unchecked');
       var status=true;
     sibblingsli.each(function(){
       console.log('sibb');
       if($(this).children().prop('checked')) status=false;
     });
       if(status) parentinput.prop('checked',false);
  }
})

// $('#user_ids').multiselect({
//           includeSelectAllOption: true,
//         });

$('#survey_form').submit(function() {
        if ($(".cls_chk_questions:checked").length  > 0) {
            // everything's fine...
        } else {
            alert('Please select atleast 1 question!');
            return false;
        }
    });
});
