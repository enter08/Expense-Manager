class BudgetItem < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	validates :user_id, presence: true
	validates_uniqueness_of :budget_date, :scope => [:category_id, :user_id]

	validates_numericality_of :value, allow_nil: true
end
