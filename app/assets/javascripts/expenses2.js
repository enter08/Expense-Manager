$(function() {
  if($("#expenses-chart2").length > 0) { 
  	Morris.Bar({
	  	element: 'expenses-chart2',
	  	data: $('#expenses-chart2').data('expenses'),
	  	xkey: 'date',
	  	ykeys: ['expense_value'],
	  	labels: ['Expense']
  	});
  }
})