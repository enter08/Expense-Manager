class Category < ActiveRecord::Base
	has_many :expenses
	has_many :budget_items

	scope :active_income, -> { where(active: true, outcome: false) }
	scope :active_outcome, -> { where(active: true, outcome: true) }
end
