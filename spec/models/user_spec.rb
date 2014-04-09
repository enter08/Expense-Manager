require 'spec_helper'

describe User do

  before { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should_not respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

end