class AddBudgetDateToBudgetItems < ActiveRecord::Migration
  def change
    add_column :budget_items, :budget_date, :date
  end
end
