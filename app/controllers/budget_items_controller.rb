class BudgetItemsController < ApplicationController

	def index
		@categories = Category.where(active: true).sort{|x,y| counts(y.id) <=> counts(x.id)}
		
		@budget_items = current_user.budget_items.where(budget_date: Date.today.at_beginning_of_month).order('category_id ASC')
		@date1 = Date.today 
		@date2 = @date1.strftime("%B")
		@total = @budget_items.sum(:value)

		@budget_items_next = current_user.budget_items.where(budget_date: (Date.today + 1.month).at_beginning_of_month).order('category_id ASC')
		@date3 = Date.today  + 1.month
		@date4 = @date3.strftime("%B")
		@total_next = @budget_items_next.sum(:value)
		
	end

	def counts(category_id)
		@expenses1 = current_user.expenses
		@categories1 = Category.all
		@categories1.each do |sorted_categories|
			@sorted_categories = @expenses1.where(category_id: category_id).count
		end
		return @sorted_categories
	end

	def new
		@categories = Category.where(active: true).sort{|x,y| counts(y.id) <=> counts(x.id)}
		@categories2 = Category.where(active: true, outcome: true)
	end

	def create_budget
		@categories = Category.where(active: true).sort{|x,y| counts(y.id) <=> counts(x.id)}
		@categories2 = Category.where(active: true, outcome: true)

		#date = params[:budget_items].map {|array2| array2.first}
		@date = params[:budget_date]

		params[:budget_items].each do |p|
       	@budget_items =	current_user.budget_items.create(p.merge(budget_date: @date))
		end
		if @budget_items.save
			redirect_to budget_items_path
		else
			render 'new'
		end
	end

	def edit_budget
		@budget_items = BudgetItem.find(params[:budget_ids])
	end

	def update_budget
		@budget_items = BudgetItem.update(params[:budget_items].keys, params[:budget_items].values)
		@budget_items.reject!{ |p| p.errors.empty? }

		if @budget_items.empty?
			redirect_to budget_items_path
		else
			render 'edit_budget'
		end
	end

	def edit
		@categories = Category.where(active: true).sort{|x,y| counts(y.id) <=> counts(x.id)}

		@budget_item = BudgetItem.find(params[:id])
	end

	def update
		@categories = Category.where(active: true).sort{|x,y| counts(y.id) <=> counts(x.id)}
		@categories2 = Category.where(active: true, outcome: true)
		
		@budget_item = current_user.budget_items.find(params[:id])
		@budget_item.update(budget_params)

		if @budget_item.save
			redirect_to budget_items_path
		else
			render 'edit'
		end
	end

	def destroy
		@budget_item = current_user.budget_items.find(params[:id])
		@budget_item.destroy
   	redirect_to budget_items_path
	end

	def delete_budget
		@budget_items = current_user.budget_items.where(budget_date: Date.today.at_beginning_of_month)
		@budget_items.each do |budget_item|
			budget_item.destroy
		end
		redirect_to budget_items_path
	end

	private
	
	def budget_params
		params.require(:budget_item).permit(:value, :budget_date, :category_id, :user_id)	
	end
end