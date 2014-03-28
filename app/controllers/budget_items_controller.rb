class BudgetItemsController < ApplicationController

	def index
		@categories = Category.where('active = true').sort{|x,y| counts(y.id) <=> counts(x.id)}
		
		@budget_items = current_user.budget_items.where('budget_date = ? and value IS NOT NULL', Date.today.at_beginning_of_month)
		@date1 = Date.today 
		@date2 = @date1.strftime("%B")
		@total = @budget_items.sum(:value)

		@budget_items_next = current_user.budget_items.where('budget_date = ? and value IS NOT NULL', (Date.today + 1.month).at_beginning_of_month)
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
		@categories = Category.where(active: true, outcome: true)
	end

	def create_budget

		#date = params[:budget_items].map {|array2| array2.first}
		@date = params[:budget_date]

		params[:budget_items].each do |p|
       		current_user.budget_items.create(p.merge(budget_date: @date))
		end

		redirect_to root_path
	end

	def update_budget
	end

	def edit
		@categories = Category.where('active = true').sort{|x,y| counts(y.id) <=> counts(x.id)}

		@budget_item = BudgetItem.find(params[:id])
	end

	def update
		@budget_item = current_user.budget_items.find(params[:id])
		@budget_item.update(budget_params)
		redirect_to budget_items_path
	end

	def destroy
		@budget_item = current_user.budget_items.find(params[:id])
		@budget_item.destroy
   	  	redirect_to budget_items_path
	end

	private
	
	def budget_params
		params.require(:budget_item).permit(:value, :budget_date, :category_id, :user_id)	end
	end