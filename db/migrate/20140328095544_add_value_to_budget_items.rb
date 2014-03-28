class AddValueToBudgetItems < ActiveRecord::Migration
  def change
    add_column :budget_items, :value, :decimal
  end
end
