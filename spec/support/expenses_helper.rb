module ExpensesHelpers
	def expenses_list
		visit root_path
		new_categories
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		@expenses = FactoryGirl.create_list(:expense, 1, user: @user, category: @category1)
		@expenses = FactoryGirl.create_list(:expense, 2, user: @user, category: @category2)
		@expenses = FactoryGirl.create_list(:expense, 3, user: @user, category: @category3)
		@expenses = FactoryGirl.create_list(:expense, 4, user: @user, category: @category4)
		@expenses = FactoryGirl.create_list(:expense, 5, user: @user, category: @category5)
		visit expenses_path
	end

	def add_single_expense
		visit root_path
		new_categories
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		click_link('New expense')
		fill_in "Description", with: "Bought a new bike"
		fill_in "Amount", with: "195.5"
		fill_in "Date", with: "2014-06-05"
		select "Entertainment", from: "Category"
		click_button('Add expense')
	end

	def new_categories
		@category1 = Category.create!(name: "Car", active: true, outcome: true)
		@category2 = Category.create!(name: "Food & Drink", active: true, outcome: true)
		@category3 = Category.create!(name: "Family & Personal", active: true, outcome: true)
		@category4 = Category.create!(name: "Bills", active: true, outcome: true)
		@category5 = Category.create!(name: "Entertainment", active: true, outcome: true)
	end

	def new_budget_items
		@user = FactoryGirl.create(:user)
		new_categories
		@budget_item1 = BudgetItem.create!(value: 100, budget_date: "2014-04-01", user: @user, category: @category1)
		@budget_item2 = BudgetItem.create!(value: 100, budget_date: "2014-04-01", user: @user, category: @category2)
		@budget_item3 = BudgetItem.create!(value: 100, budget_date: "2014-04-01", user: @user, category: @category3)
		@budget_item4 = BudgetItem.create!(value: 100, budget_date: "2014-04-01", user: @user, category: @category4)
		@budget_item5 = BudgetItem.create!(value: 100, budget_date: "2014-04-01", user: @user, category: @category5)
	end
end

RSpec.configure do |config|
	config.include ExpensesHelpers
end