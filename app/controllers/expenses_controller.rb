require 'will_paginate/array' 
require 'csv'

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
			@expenses = @expenses.order('date DESC').page(params[:page]).per_page(8)

		@income = @expenses.where("date > ? and outcome = false", Date.today.at_beginning_of_month).sum(:expense_value)
		@outcome = @expenses.where("date > ? and outcome = true", Date.today.at_beginning_of_month).sum(:expense_value)
		@total = @income - (@outcome).abs

		@budget_items = current_user.budget_items.where(budget_date: Date.today.at_beginning_of_month)
		@budget = @budget_items.sum(:value)

		@money_left = @budget - (@total).abs

		respond_to do |format|
			format.html
			format.csv { send_data @expenses.to_csv }
			format.xls #{ send_data @expenses.to_csv(col_sep: "\t") }
		end
	end

	# (for later use)
	# def mdate
 	#   month = params[:month_select]
 	#   redirect_to :action => "index"
	# end

	def new
		@expense = Expense.new

		@categories = Category.where('active = true').sort{|x,y| counts(y.id) <=> counts(x.id)}

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

	def new_income
		@expense = Expense.new

		@categories = Category.where('active = true').sort{|x,y| counts(y.id) <=> counts(x.id)}

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

		@categories = Category.where('active = true').sort{|x,y| counts(y.id) <=> counts(x.id)}

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

		@categories = Category.where('active = true').sort{|x,y| counts(y.id) <=> counts(x.id)}

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

	def statistics
		@categories = Category.all.where(active: true).sort{|x,y| count_exps_month(y.id) <=> count_exps_month(x.id)}
		@week_list = Category.all.where(active: true).sort{|x,y| count_exps_week(y.id) <=> count_exps_week(x.id)}

		@expenses = current_user.expenses	
		@date1 = Date.today 
		@date2 = @date1.strftime("%B")
		@total = @expenses.where("date > ?", Date.today.at_beginning_of_month).sum(:expense_value)
		@avg_exp = (@expenses.where("date > ?", Date.today.at_beginning_of_month).sum(:expense_value)/30).round(2)
		@avg_exp_week = (@expenses.where("date > ?", (Date.today-6.days)).sum(:expense_value)/7).round(2)
		@max = @expenses.where("date > ?", Date.today.at_beginning_of_month).maximum(:expense_value)

		@income = @expenses.where("date > ? and outcome = false", Date.today.at_beginning_of_month).sum(:expense_value)
		@outcome = @expenses.where("date > ? and outcome = true", Date.today.at_beginning_of_month).sum(:expense_value)
		@saldo = @income - (@outcome).abs

		gon.income = @expenses.where("date > ? and outcome = false", Date.today.at_beginning_of_month).sum(:expense_value)
		gon.outcome = @expenses.where("date > ? and outcome = true", Date.today.at_beginning_of_month).sum(:expense_value)

		@budget_items = current_user.budget_items.where(budget_date: Date.today.at_beginning_of_month)
		@budget = @budget_items.sum(:value)

		@money_left = @budget - (@saldo).abs

		@income_today = @expenses.where("date = ? and outcome = false", Date.today).sum(:expense_value)
		@outcome_today = @expenses.where("date = ? and outcome = true", Date.today).sum(:expense_value)

		@total_today = @income_today - (@outcome_today).abs

		@rec_today = -(@budget/((Date.today + 1.month).at_beginning_of_month - 1.days).day).abs
	end

	def count_exps_month(category_id)
		@expenses2 = current_user.expenses.where("date > ?", Date.today.at_beginning_of_month)
		@categories3 = Category.all.where(active: true)
		@categories3.each do |sum_of_exps|
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

	private
	
	def expense_params
		params.require(:expense).permit(:description, :date, :outcome, :expense_value, :location_id, :category_id, :bill)
	end
end