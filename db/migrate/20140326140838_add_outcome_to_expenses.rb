class AddOutcomeToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :outcome, :boolean
  end
end
