require 'spec_helper'

feature 'Sign in as a user' do
	scenario 'with an email address' do
		@user = FactoryGirl.create(:user)
		sign_in(@user)
		expect(page).to have_css "p", text: "Signed in"
	end	
end