module BudgetsHelper

  def self.copyBudgets

    @budget_items = current_user.budget_items.where('budget_date = ?', (Date.today + 1.month).at_beginning_of_month)
    @budget_items_next = current_user.budget_items.where('budget_date = ?', (Date.today + 1.month).at_beginning_of_month)

    puts "There are currently #{BudgetItem.count} budget items,"
    puts "#{@budget_items.count} for this month and"
    puts "#{@budget_items_next.count} for the next month."

  end
end