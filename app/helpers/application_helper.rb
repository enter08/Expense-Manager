module ApplicationHelper
	def counts(cat)
		@expenses1 = current_user.expenses
		@categories1 = Category.all
		@categories1.each do |n|
			@n = @expenses1.where(category_id: cat).count
		end
		return @n
	end
end
