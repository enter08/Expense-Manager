require 'spec_helper'

#before_filter :authenticate_user!

feature 'View the homepage' do 
	scenario 'user sees relevant information' do
		visit root_path
		expect(page).to have_css 'title', text: 'Expense manager'
		expect(page).to have_css '[data-role="description"]'
	end
end