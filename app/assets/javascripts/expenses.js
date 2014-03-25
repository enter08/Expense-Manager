$(function() { 
  if($("#expenses-chart").length > 0) {
	  Morris.Bar({
		  element: 'expenses-chart',
		  data: $('#expenses-chart').data('expenses'),
		  xkey: 'date',
		  ykeys: ['expense_value'],
		  labels: ['Expense']
	  });
  }
})