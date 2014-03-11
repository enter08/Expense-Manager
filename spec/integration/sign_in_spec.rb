require 'spec_helper'

feature 'Sign in as a user' do
	scenario 'with an email address' do
		FactoryGirl.create(:user)
		visit new_user_session_path
		fill_in 'Email', with: 'person@example.com'
		fill_in 'Password', with: 'password'
		click_button 'Sign in'
		expect(page).to have_css "p", text: "Signed in"
	end	
end

