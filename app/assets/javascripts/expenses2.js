$(function() { 

	if($("#expenses-chart-week").length > 0) {
		  Morris.Area({
			  element: 'expenses-chart-week',
			  data: $('#expenses-chart-week').data('expensesw'),
			  xkey: 'date',
			  ykeys: ['expense_value'],
			  labels: ['Expense'],
			  postUnits: ' €'
		  });
	 }

  if($("#categs_chart").length > 0) { 
		Morris.Bar({
			element: 'categs_chart',
			data: $('#categs_chart').data('eexpenses'),
		  	xkey: 'name',
		  	ykeys: ['expense_value'],
		  	labels: ['Expense'],
		  	postUnits: ' €'
		});
	}

	if($("#income_chart").length > 0) { 
		Morris.Donut({
		  element: 'income_chart',
		  data: [
		    {label: "Income", value: gon.income},
		    {label: "Outcome", value: gon.outcome}
		  ]
		});
	}
})