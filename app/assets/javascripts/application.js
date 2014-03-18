// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-datepicker
//= require_tree .

var todaysDate = new Date();
 
$(document).on("focus", "[data-behaviour~='datepicker']", function(e){
    $(this).datepicker({"format": "yyyy-mm-dd", "startDate": Date.today, "autoclose": true})
  
    // $(this).datepicker.on('changeDate', functin(ev) {
    // 	// if (ev.date.valueOf() > todaysDate.valueOf()) {
    // 	// 	$('#alert').show().find('strong').text('Date of Birth must not be after today!');
    // 	// } else {
    //  //        $('#alert').hide();
    //  //        startDate = new Date(ev.date);
    //  //        $('#date-start-display').text($('#date-start').data('date'));    		
    // 	// }
    //     // $('#date_dob').datepicker('hide');    	
    // }) ;
});

$(document).on("focus", "[data-behaviour~='datepicker1']", function(e){
    $(this).datepicker({"format": "mm", "minViewMode": 1, "startDate": Date.month, "autoclose": true})
});

// <input type="text" data-behaviour='datepicker' >

// <script type="text/javascript">
//   $(document).ready(function(){
//     $('[data-behaviour~=datepicker]').datepicker();
//   })
// </script>