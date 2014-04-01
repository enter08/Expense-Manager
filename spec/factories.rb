FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com" }
    password "password"
  end

  factory :category do
  	sequence(:name) {|n| "Other#{n}" }
    active true
    default true
    outcome true
  end

  factory :expense do
  	sequence(:description) { |n| "Bought something#{n}" }
  	sequence(:expense_value) { |n| "#{1 + rand(44)}" }
    date { (Date.today - 1.month) + rand(60).days }
    outcome true
  	user
  	category
    location
  end

  factory :location do
    sequence(:name) { |n| "Location#{n}" }
  end

  factory :budget_item do
    sequence(:value) { |n| "#{1 + rand(65)}" }
    date '2014-03-01'
    user
    category
  end
end