class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.decimal :value
      t.date :budget_date
    end
  end
end
