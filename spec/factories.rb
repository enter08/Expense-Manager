FactoryGirl.define do
  factory :user do
    email "person@example.com"
    password "password"
  end

  factory :expense do
  	sequence(:description) { |n| "Bought a new bike#{n}" }
  	sequence(:expense_value) { |n| "#{200 + n}" }
  end
end