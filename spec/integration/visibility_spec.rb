require 'spec_helper'

feature 'Expenses can be accessed only by current user' do
	scenario 'index should list only current users expenses' do
		add_single_expense
		visit root_path
		click_link('Sign out')
		visit new_user_registration_path
		fill_in 'Email', with: "another_person@example.com"
		fill_in 'Password', with: "password"
		fill_in 'Password confirmation', with: "password"
		click_button 'Sign up'
		click_link('My expenses')
		expect(page).not_to have_css("thumbnail")
	end

	scenario "other users can't destroy my expenses" do
		visit root_path
		@user = FactoryGirl.create(:user)
		@expense = FactoryGirl.create(:expense, user: @user)
		sign_in_userless
		expect{page.driver.submit :delete, expense_path(@expense), {}}.to raise_error
	end

	scenario "other users can't update my expenses" do
		visit root_path
		@user = FactoryGirl.create(:user)
		@expense = FactoryGirl.create(:expense, user: @user)
		sign_in_userless
		expect{page.driver.submit :patch, expense_path(@expense), {}}.to raise_error
	end
end