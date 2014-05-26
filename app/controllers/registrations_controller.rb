class RegistrationsController < Devise::RegistrationsController

    def create
        super
        ExpmanMailer.welcome_email(@user).deliver
    end

end