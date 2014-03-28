class AddLocationRefToExpenses < ActiveRecord::Migration
  def change
    add_reference :expenses, :location, index: true
  end
end
