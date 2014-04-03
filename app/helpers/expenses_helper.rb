 module ExpensesHelper
  def expenses_chart_data
  	expenses_by_day = current_user.expenses.where(outcome: true).total_grouped_by_day(Date.today - 1.month )
		((Date.today - 1.month)..Date.today).map do |d|
			{
				date: d.to_date,
				expense_value: expenses_by_day.fetch(d, []).first.try(:total_expense) || 0
			}
		end
  end

  def expenses_chart_data2
  	expenses_by_day = current_user.expenses.where(outcome: true).total_grouped_by_day(Date.today.at_beginning_of_month)
		(Date.today.at_beginning_of_month..Date.today).map do |d|
			{
				date: d.to_date,
				expense_value: expenses_by_day.fetch(d, []).first.try(:total_expense) || 0
			}
		end
  end

  def expenses_chart_data_week
  	expenses_by_day = current_user.expenses.where(outcome: true).total_grouped_by_day((Date.today-6.days))
	((Date.today-6.days)..Date.today).map do |d|
		{
			date: d.to_date,
			expense_value: expenses_by_day.fetch(d, []).first.try(:total_expense) || 0
		}
	end
  end

  def expenses_by_category_chart
  	Category.where(active: true).map do |n|
  		{
  			name: n.name,
  			expense_value: current_user.expenses.where('category_id = ? and date > ?', n.id, Date.today.at_beginning_of_month).sum(:expense_value).to_s
  		}
  	end
  end

 #  def category_expenses
 #  	expenses_by_category = Expense.total_expense_by_month(Date.today.at_beginning_of_month)
	# name: cat_names
	# expense_value = expenses_by_category
 #  end
end