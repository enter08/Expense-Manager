require 'will_paginate/array' 

class ExpensesController < ApplicationController

	def counts(category_id)
		@expenses1 = current_user.expenses
		@categories1 = Category.all
		@categories1.each do |sorted_categories|
			@sorted_categories = @expenses1.where(category_id: category_id).count
		end
		return @sorted_categories
	end

	def index

		@categories = Category.where('active = true').sort{|x,y| counts(y.id) <=> counts(x.id)}

		if params[:category] && params[:search]
			@expenses = current_user.expenses(conditions: ['description LIKE ?', "%#{params[:search]}%"])
			@expenses.select!{ |c| c.category_id == params[:category] }
		elsif params[:category]
			@expenses = current_user.expenses.where(category_id: params[:category])
		elsif params[:search]
			@expenses = current_user.expenses.where(['description LIKE ?', "%#{params[:search]}%"])
		else
			@expenses = current_user.expenses
		end
			@expenses = @expenses.page(params[:page]).per_page(8)

	#	@date1 = Date.today 
	#	@date2 = @date1.strftime("%B")
	end

	# (for later use)
	# def mdate
 	#   month = params[:month_select]
 	#   redirect_to :action => "index"
	# end

	def new
		@expense = Expense.new

		@categories = Category.all.sort{|x,y| counts(y.id) <=> counts(x.id)}

		if params[:category] && params[:search]
			@expenses = current_user.expenses(conditions: ['description LIKE ?', "%#{params[:search]}%"])
			@expenses.select!{ |c| c.category_id == params[:category] }
		elsif params[:category]
			@expenses = current_user.expenses.where(category_id: params[:category])
		elsif params[:search]
			@expenses = Expense.all(conditions: ['description LIKE ?', "%#{params[:search]}%"])
		else
			@expenses = current_user.expenses
		end
	end

	def create
		@expense = current_user.expenses.build(expense_params)
		if @expense.save
			redirect_to expenses_path
		else
			render 'new'
		end
	end

	def destroy
		@expense = current_user.expenses.find(params[:id])
		@expense.destroy
   	  	redirect_to expenses_path
	end

	def edit

		@expense = Expense.find(params[:id])

		@categories = Category.all.sort{|x,y| counts(y.id) <=> counts(x.id)}

		if params[:category] && params[:search]
			@expenses = current_user.expenses(conditions: ['description LIKE ?', "%#{params[:search]}%"])
			@expenses.select!{ |c| c.category_id == params[:category] }
		elsif params[:category]
			@expenses = current_user.expenses.where(category_id: params[:category])
		elsif params[:search]
			@expenses = Expense.all(conditions: ['description LIKE ?', "%#{params[:search]}%"])
		else
			@expenses = current_user.expenses
		end
	end

	def update
		@expense = current_user.expenses.find(params[:id])
		@expense.update(expense_params)
		redirect_to expenses_path
	end

	def show
		@expense = current_user.expenses.find(params[:id])

		@categories = Category.all.sort{|x,y| counts(y.id) <=> counts(x.id)}

		if params[:category] && params[:search]
			@expenses = current_user.expenses(conditions: ['description LIKE ?', "%#{params[:search]}%"])
			@expenses.select!{ |c| c.category_id == params[:category] }
		elsif params[:category]
			@expenses = current_user.expenses.where(category_id: params[:category])
		elsif params[:search]
			@expenses = Expense.all(conditions: ['description LIKE ?', "%#{params[:search]}%"])
		else
			@expenses = current_user.expenses
		end

		@date1 = @expense.date
		@date2 = @date1.strftime("%d. %B, %Y")
	end

	private
	
	def expense_params
		params.require(:expense).permit(:description, :date, :expense_value, :category_id, :bill)
	end
end