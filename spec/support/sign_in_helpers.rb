module SignInHelpers
	def sign_in(user)
		visit new_user_session_path
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
	end

	def sign_in_userless
		@user = FactoryGirl.create(:user)
		sign_in(@user)
	end

	def sign_up
		visit new_user_registration_path
		fill_in 'Email', with: "person@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_button 'Sign up'
	end

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
		@category1 = Category.create!(name: "Car")
		@category2 = Category.create!(name: "Food & Drink")
		@category3 = Category.create!(name: "Family & Personal")
		@category4 = Category.create!(name: "Bills")
		@category5 = Category.create!(name: "Entertainment")
	end
end

RSpec.configure do |config|
	config.include SignInHelpers
end