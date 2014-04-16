module BudgetsHelper

  def self.copy_budgets

    @budget_items = BudgetItem.where('budget_date = ?', Date.today.at_beginning_of_month)
    @budget_items_next = BudgetItem.where('budget_date = ?', (Date.today + 1.month).at_beginning_of_month)

    puts "There are currently #{BudgetItem.count} budget items,"
    puts "#{@budget_items.count} for this month and"
    puts "#{@budget_items_next.count} for the next month."

    @budget = BudgetItem.all

    if @budget.where("budget_date = ?", (Date.today + 2.months).at_beginning_of_month).any?
			puts "User has a budget for the next month already."
		elsif @budget.where("budget_date = ?", Date.today.at_beginning_of_month).any?
			@budget_items.each do |budget_item|
				if budget_item.value != nil
					params = ActionController::Parameters.new({
					  budget: {
					    category_id: budget_item.category_id,
					    budget_date:  budget_item.budget_date + 2.months,
					    value: budget_item.value,
					    user_id: budget_item.user_id
					  }
					})

					permitted = params.require(:budget).permit(:user_id, :category_id, :budget_date, :value)

					BudgetItem.create!(permitted)					
				end
			end
		end

		puts "Budgets are updated"
		puts "There are #{BudgetItem.count} budget items now."

  end
end