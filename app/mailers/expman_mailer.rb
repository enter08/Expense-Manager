class ExpmanMailer < ActionMailer::Base
  default from: "shiljos@gmail.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome to Expense Manager!')
  end
end
