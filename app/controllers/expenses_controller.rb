class ExpensesController < ApplicationController

	def index
		@expenses = Expense.all
	end

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(expense_params)
		@expense.save
		redirect_to expenses_path
	end

	def destroy
		expense = Expense.find(params[:id])
		expense.destroy
   	  	redirect_to expenses_path
	end

	def edit
		@expense = Expense.find(params[:id])
	end

	def update
		@expense = Expense.find(params[:id])
		@expense.update(expense_params)
		redirect_to expenses_path
	end

	def show
		@expense = Expense.find(params[:id])
	end

	private
	
	def expense_params
		params.require(:expense).permit(:description, :expense_value)
	end
end