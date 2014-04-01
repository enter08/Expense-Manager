require 'spec_helper'

describe Location do
  
  before {@location = FactoryGirl.create(:location) }

  subject { @location }

  it { should respond_to(:name) }
  
end
