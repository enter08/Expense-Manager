class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :expense_value
      t.string :description
      
      t.timestamps
    end
  end
end
