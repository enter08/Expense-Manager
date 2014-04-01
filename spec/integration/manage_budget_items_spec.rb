require 'spec_helper'

feature 'Manage budget items' do
	scenario 'create new budget items' do
		expenses_list
		visit new_budget_item_path
		expect(page).to have_content("Add your monthly budget")
		page.find_field(@category1.name).set(100)
		page.find_field(@category3.name).set(200)
		page.find_field(@category5.name).set(40)
		click_button('Submit')
		expect(page).to have_content("Budget for")
	end

	scenario 'see budgets list' do
		expenses_list
		visit new_budget_item_path
		page.find_field(@category1.name).set(100)
		page.find_field(@category3.name).set(200)
		page.find_field(@category5.name).set(40)
		click_button('Submit')
		expect(page).to have_content("Budget for")
		expect(page).to have_content(@category1.name)
		expect(page).to have_content("100.00 €")
		expect(page).to have_content("Total")
		expect(page).to have_content("340.00 €")
	end

	scenario 'edit one budget item' do
		new_budget_items
		sign_in(@user)
		visit budget_items_path
		expect(page).to have_content("Total")
		expect(page).to have_content("500.00 €")
		page.all('a', text: 'Edit')[1].click
		expect(page).to have_content("Category budget")
		page.find_field("Category budget").set(150)
		click_button('Save changes')
		expect(page).to have_content("Total")
		expect(page).to have_content("550.00 €")
	end

	scenario 'delete budget_item' do
		new_budget_items
		sign_in(@user)
		visit budget_items_path
		expect(page).to have_css("a", text: 'Delete', count: 6)
		page.all('a', text: 'Delete')[1].click
		expect(page).to have_css("a", text: 'Delete', count: 5)
	end

	# scenario 'edit multiple budget items' do
	# 	new_budget_items
	# 	sign_in(@user)
	# 	visit budget_items_path
	# 	find(:css, "#budget_ids_[value='#{@budget_item1.id}']").set(true)
	# 	find(:css, "#budget_ids_[value='#{@budget_item2.id}']").set(true)
	# 	find(:css, "#budget_ids_[value='#{@budget_item4.id}']").set(true)
	# 	#click_button('Edit checked1')
	# 	page.find('#current-month').click
	# end
end