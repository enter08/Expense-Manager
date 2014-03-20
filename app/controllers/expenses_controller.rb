require 'will_paginate/array' 

class ExpensesController < ApplicationController

	def index
		
		@categories = Category.all

#		@categories = Category.find(:all).sort{|x,y| counts(x.id) <=> counts(y.id)}

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

		@expenses = @expenses.page(params[:page]).per_page(8)
	# 	if params[:search]
	# 		@expenses = Expense.all(conditions: ['description LIKE ?', "%#{params[:search]}%"])
	# 	else
	# 		@expenses = Expense.all
	# 	end
		@date1 = Date.today 
		@date2 = @date1.strftime("%B")
	end

	# def mdate
 #      month = params[:month_select]
 #      redirect_to :action => "index"
	# end

	def new
		@expense = Expense.new
	end

	def create
		# @expense = Expense.new(expense_params)
		# @expense.user = current_user
		@expense = current_user.expenses.build(expense_params)
		if @expense.save
			redirect_to expenses_path
		else
			render 'new'
		end
	end

	def destroy
		#expense = Expense.find(params[:id])
		@expense = current_user.expenses.find(params[:id])
		@expense.destroy
   	  	redirect_to expenses_path
	end

	def edit
		@expense = Expense.find(params[:id])
	end

	def update
		# @expense = Expense.find(params[:id])
		# @expense.update(expense_params)
		@expense = current_user.expenses.find(params[:id])
		@expense.update(expense_params)
		redirect_to expenses_path
	end

	def show
		@expense = current_user.expenses.find(params[:id])
		#@expense = Expense.find(params[:id])
	end

	private
	
	def expense_params
		params.require(:expense).permit(:description, :date, :expense_value, :category_id, :bill)
	end
end