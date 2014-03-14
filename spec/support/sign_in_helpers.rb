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
		@category1 = FactoryGirl.create(:category)
		@category2 = FactoryGirl.create(:category)
		@category3 = FactoryGirl.create(:category)
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		@expenses = FactoryGirl.create_list(:expense, 3, user: @user, category: @category1)
		@expenses = FactoryGirl.create_list(:expense, 2, user: @user, category: @category2)
		@expenses = FactoryGirl.create_list(:expense, 5, user: @user, category: @category3)
		visit expenses_path
	end

	def add_single_expense
		visit root_path
		@category = FactoryGirl.create_list(:category, 10)
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		click_link('Add a new expense')
		fill_in "Description", with: "Bought a new bike"
		fill_in "Amount", with: "195.5"
		click_button('Add to my expenses')
	end
end

RSpec.configure do |config|
	config.include SignInHelpers
end