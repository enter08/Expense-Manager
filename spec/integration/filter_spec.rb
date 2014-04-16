require 'spec_helper'

feature 'Manage expenses' do
	scenario 'list all expenses by category' do
		expenses_list
		expect(page).to have_css 'a.list-group-item.active', text:'All Expenses'
		click_link('All Expenses')
		expect(page).to have_css("div.thumbnail", count: 8)
		click_link('2')
		expect(page).to have_css("div.thumbnail", count: 7)
	end

	scenario 'sidebar and badges test' do
		expenses_list
		expect(page).to have_css('a.list-group-item.active', count: 1)
		expect(page).to have_css('a.list-group-item', count: 6)
		expect(page).to have_css('span.badge', count: 5)
		expect(page).to have_css 'span.badge', text: "3"
		expect(page).to have_css 'span.badge', text: "4"
		expect(page).to have_css 'span.badge', text: "5"
	end

	scenario 'filter expenses by category' do
		expenses_list
		click_link(@category4.name)
		expect(page).to have_css("div.thumbnail", count: 4)
	end

	# scenario 'search expenses via input form' do
	# 	add_single_expense
	# 	click_link('New expense')
	# 	fill_in "Description", with: "Bought a new car"
	# 	fill_in "Amount", with: "15000"
	# 	fill_in "Date", with: "2014-06-05"
	# 	select "Car", from: "Category"
	# 	click_button('Add expense')
	# 	fill_in "Search", with: "bike"
	# 	click_button("Search")
	# 	expect(page).to have_css("div.thumbnail", count: 1)
	# 	expect(page).to have_css 'h4.ex_v', text: "195.5"
	# 	expect(page).not_to have_css 'h4.ex_v', text: "15000"
	# end
end