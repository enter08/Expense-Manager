class ExpmanMailer < ActionMailer::Base
  default from: "demicredzep1990@gmail.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subjet: 'Welcome')
  end
end
