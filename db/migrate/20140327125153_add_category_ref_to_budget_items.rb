class AddCategoryRefToBudgetItems < ActiveRecord::Migration
  def change
    add_reference :budget_items, :category, index: true
  end
end
