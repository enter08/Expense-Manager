FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password "password"
  end

  factory :category do
  	sequence(:name) { |n| "test_category#{n}" }
  end

  factory :expense do
  	sequence(:description) { |n| "Bought a new bike#{n}" }
  	sequence(:expense_value) { |n| "#{200 + n}" }
  	user
  	# category
  end
end