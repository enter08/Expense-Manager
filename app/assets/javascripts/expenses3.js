$(function() { 
  if($("#expenses-chart3").length > 0) {
	  Morris.Donut({
  		element: 'expenses-chart3',
  		data: $('#expenses-chart3').data('expenses2'),
  		value: 'expense_value',
  		label: ['Expense']
	  });
  }
})