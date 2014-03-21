require 'spec_helper'

describe Category do
  
  before {@category = FactoryGirl.create(:category) }

  subject { @category }

  it { should respond_to(:name) }

end
