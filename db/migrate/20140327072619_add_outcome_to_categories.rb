class AddOutcomeToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :outcome, :boolean
  end
end
