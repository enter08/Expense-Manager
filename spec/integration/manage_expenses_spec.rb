require 'spec_helper'

feature 'Manage expenses' do
	scenario 'create a new expense' do
		add_single_expense
		expect(page).to have_css 'li.expense_d', text: "Bought a new bike"
		expect(page).to have_css 'li.expense_v', text: "195.5"
	end

	scenario 'list all expenses' do
		expenses_list
		expect(page).to have_css("li", count: 20)
	end

	scenario 'delete an expense' do
		expenses_list
		page.all('a', :text => 'Delete this expense')[1].click
		expect(page).to have_css("li", count:18)
	end

	scenario 'find edit page' do
		expenses_list
		expect(page).to have_css("a", count: 30)
		page.all('a', text: 'Edit this expense')[1].click
		expect(page).to have_content("Update your expense")
	end

	scenario 'update expense' do
		add_single_expense
		click_link('Edit this expense')
		expect(page).to have_content("Update your expense")
		fill_in "Description", with: "Bought a car"
		fill_in "Amount", with: "15000"
		click_button('Save changes')
		expect(page).to have_css 'li.expense_d', text: "Bought a car"
		expect(page).to have_css 'li.expense_v', text: "15000"
	end

	scenario 'see expense details' do
		add_single_expense
		click_link('Details')
		expect(page).to have_content("Details")
		expect(page).to have_content("You've spent 195.5€.")
	end
end