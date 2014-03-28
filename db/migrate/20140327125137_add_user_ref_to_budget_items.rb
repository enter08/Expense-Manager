class AddUserRefToBudgetItems < ActiveRecord::Migration
  def change
    add_reference :budget_items, :user, index: true
  end
end
