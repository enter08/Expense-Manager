require 'spec_helper'

feature 'Manage expenses' do
	scenario 'create a new expense' do
		visit root_path
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		click_link('Add a new expense')
		fill_in "Description", with: "Bought a new bike"
		fill_in "Amount", with: "195.50"
		click_button('Add to my expenses')

		expect(page).to have_css 'li.expense_d', text: "Bought a new bike"
		expect(page).to have_css 'li.expense_v', text: "195.50"
	end

	scenario 'list all expenses' do
		visit root_path
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		@expenses = FactoryGirl.create_list(:expense, 10)
		visit expenses_path

		expect(page).to have_css("li", count: 20)
	end
end