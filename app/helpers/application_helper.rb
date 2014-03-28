module ApplicationHelper
	def counts(cat)
		@expenses1 = current_user.expenses
		@categories1 = Category.all
		@categories1.each do |n|
			@n = @expenses1.where(category_id: cat).count
		end
		return @n
	end

	def count_exps(category_id)
		@expenses2 = current_user.expenses.where("date > ?", Date.today.at_beginning_of_month)
		@categories2 = Category.all
		@categories2.each do |sum_of_exps|
			@sum_of_exps = @expenses2.where(category_id: category_id).sum(:expense_value)
		end
		return @sum_of_exps
	end

	def count_exps_week(category_id)
		@expenses2 = current_user.expenses.where("date > ?", (Date.today-6.days))
		@categories4 = Category.all.where(active: true)
		@categories4.each do |sum_of_exps|
			@sum_of_exps = @expenses2.where(category_id: category_id).sum(:expense_value)
		end
		return @sum_of_exps
	end
end
