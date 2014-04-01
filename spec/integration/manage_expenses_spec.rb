require 'spec_helper'

feature 'Manage expenses' do
	scenario 'create a new expense' do
		add_single_expense
		expect(page).not_to have_css 'h4.expense_d', text: "Bought a new bike"
		expect(page).to have_css 'h4.ex_v', text: "195.5"
		expect(page).to have_css 'h3.ex_c', text: "Entertainment"
		expect(page).to have_content "05. June, 2014."
	end

	scenario 'list all expenses on first page' do
		expenses_list
		expect(page).to have_css("div.thumbnail", count: 8)
	end

	scenario 'pagination test for expenses on second page' do
		expenses_list
		click_link('2')
		expect(page).to have_css("div.thumbnail", count: 7)
	end

	scenario 'delete an expense' do
		expenses_list
		page.all('a', :text => 'Delete')[1].click
		click_link('2')
		expect(page).to have_css("div.thumbnail", count: 6)
	end

	scenario 'find edit page' do
		expenses_list
		expect(page).to have_css("div.thumbnail", count: 8)
		page.all('a', text: 'Edit')[1].click
		expect(page).to have_content("Edit expense")
	end

	scenario 'update expense' do
		add_single_expense
		click_link('Edit')
		expect(page).to have_content("Edit expense")
		fill_in "Description", with: "Bought a new car"
		fill_in "Amount", with: "15000"
		fill_in "Date", with: "2014-06-12"
		select "Car", from: "Category"
		click_button('Save changes')
		expect(page).to have_css 'h4.ex_v', text: "15000"
		expect(page).to have_css 'h3.ex_c', text: "Car"
		expect(page).to have_content "12. June, 2014."
	end

	scenario 'see expense details' do
		add_single_expense
		click_link('Show')
		expect(page).to have_css 'div.well', text: "Entertainment"
		expect(page).to have_content("195.5 €")
		expect(page).to have_css 'div.note', text: "You've spent 195.5€ when you bought a new bike."
	end	

	scenario 'test image upload' do
		visit root_path
		new_categories
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		click_link('New expense')
		fill_in "Description", with: "Bought a new bike"
		fill_in "Amount", with: "195.5"
		fill_in "Date", with: "2014-06-05"
		select "Entertainment", from: "Category"
		attach_file('expense_bill', Rails.root+'public/images/medium/def.jpg')
		click_button('Add expense')
		expect(page).not_to have_css 'h4.expense_d', text: "Bought a new bike"
		expect(page).to have_css 'h4.ex_v', text: "195.5"
		expect(page).to have_css 'h3.ex_c', text: "Entertainment"
		expect(page).to have_content "05. June, 2014."
		expect(page).to have_css("img[alt=Def]")
	end
end