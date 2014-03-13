require 'spec_helper'

feature 'Sign out a user' do
	scenario 'and redirect to sign in page' do
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		expect(page).to have_css "a", text: "Logout"
		click_link "Logout"
		expect(page).to have_css "p", text: "You need to sign in or sign up before continuing."
	end
end