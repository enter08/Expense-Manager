 module ExpensesHelper
  def expenses_chart_data
  	expenses_by_day = Expense.total_grouped_by_day(4.weeks.ago)
	(Date.today.at_beginning_of_month..Date.today).map do |d|
		{
			date: d.to_date,
			expense_value: expenses_by_day[d][0].try(:total_expense) || 0
		}
	end
  end
end