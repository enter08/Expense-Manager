require 'spec_helper'

feature 'Sign up a user' do
	scenario 'with an e-mail' do
		sign_up
		expect(page).to have_css "p", text: "Welcome! You have signed up successfully."
	end
end