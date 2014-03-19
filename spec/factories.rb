FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password "password"
  end

  factory :category do
  	sequence(:name) {|n| "Other#{n}" }
  end

  factory :expense do
  	sequence(:description) { |n| "Bought something#{n}" }
  	sequence(:expense_value) { |n| "#{200 + rand(324)}" }
    date { Date.today }
  	user
  	category
  end
end