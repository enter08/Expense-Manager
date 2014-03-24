require 'spec_helper'
feature 'Manage categories' do
	scenario 'remove active category' do
		@category1 = Category.create!(name: "Car", active: true, default: true)
		@category2 = Category.create!(name: "Rent", active: true, default: false)
		@category2 = Category.create!(name: "Kids", active: false, default: false)
		visit root_path
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		visit expenses_path
		expect(page).to have_css('a.list-group-item.active', count: 1)
		expect(page).to have_css('a.list-group-item', count: 3)
		click_link('Categories')
		expect(page).to have_content("Categories list management")
		expect(page).to have_css("button", text: "Default")
		click_on('Remove')
		expect(page).to have_css("button", text: "Add", count: 2)
		visit expenses_path
		expect(page).to have_css('a.list-group-item', count: 2)
	end

	scenario 'add inactive category' do
		@category1 = Category.create!(name: "Car", active: true, default: true)
		@category2 = Category.create!(name: "Rent", active: true, default: false)
		@category2 = Category.create!(name: "Kids", active: false, default: false)
		visit root_path
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		visit expenses_path
		expect(page).to have_css('a.list-group-item', count: 3)
		click_link('Categories')
		expect(page).to have_content("Categories list management")
		click_on('Add')
		expect(page).to have_css("button", text: "Remove", count: 2)
		visit expenses_path
		expect(page).to have_css('a.list-group-item', count: 4)
	end
end