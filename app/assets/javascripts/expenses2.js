$(function() { 

	if($("#expenses-chart-week").length > 0) {
		  Morris.Area({
			  element: 'expenses-chart-week',
			  data: $('#expenses-chart-week').data('expensesw'),
			  xkey: 'date',
			  ykeys: ['expense_value'],
			  labels: ['Expense']
		  });
	 }

  	if($("#categs_chart").length > 0) { 
		Morris.Bar({
			element: 'categs_chart',
			data: $('#categs_chart').data('eexpenses'),
		  	xkey: 'name',
		  	ykeys: ['expense_value'],
		  	labels: ['Expense'],
		  	postUnits: '€'
		});
	}
})