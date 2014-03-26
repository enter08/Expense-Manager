require 'factory_girl_rails'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

  @users = FactoryGirl.create_list(:user, 4)

  @category1 = Category.create!(name: "Car", active: true, default: true, default: false)
  @category2 = Category.create!(name: "Food & Drink", active: true, default: true)
  @category3 = Category.create!(name: "Family & Personal", active: true, default: true)
  @category4 = Category.create!(name: "Bills", active: true, default: true)
  @category5 = Category.create!(name: "Entertainment", active: true, default: false)
  @category6 = Category.create!(name: "Travel", active: true, default: true)
  @category7 = Category.create!(name: "Hobbies", active: true, default: false)
  @category8 = Category.create!(name: "Home", active: true, default: true)
  @category9 = Category.create!(name: "Healthcare", active: true, default: false)
  @category10 = Category.create!(name: "Debt", active: true, default: true)
  @category11 = Category.create!(name: "Shopping", active: true, default: true)
  @category12 = Category.create!(name: "Education", active: true, default: true)
  @category13 = Category.create!(name: "Transport", active: true, default: false)
  @category14 = Category.create!(name: "Other", active: true, default: false)
  @category15 = Category.create!(name: "Cinema", active: false, default: false)
  @category16 = Category.create!(name: "Gifts", active: false, default: false)
  @category17 = Category.create!(name: "Utilities", active: false, default: false)
  @category18 = Category.create!(name: "Rent", active: false, default: false)
  @category19 = Category.create!(name: "Accomodation", active: false, default: false)
  @category20 = Category.create!(name: "Clothing", active: false, default: false)
  @category21 = Category.create!(name: "Drink", active: false, default: false)
  @category22 = Category.create!(name: "Pets", active: false, default: false)
  @category23 = Category.create!(name: "Love", active: false, default: false)
  @category24 = Category.create!(name: "Kids", active: false, default: false)
  @category25 = Category.create!(name: "Savings", active: false, default: false)

  @users.each do |user|
  	FactoryGirl.create_list(:expense, 4, user: user, category: @category1, outcome: true)
    FactoryGirl.create_list(:expense, 3, user: user, category: @category1, outcome: false)
  	FactoryGirl.create_list(:expense, 3, user: user, category: @category2, outcome: true)
  	FactoryGirl.create_list(:expense, 5, user: user, category: @category3, outcome: true)
    FactoryGirl.create_list(:expense, 4, user: user, category: @category3, outcome: true)
  	FactoryGirl.create_list(:expense, 11, user: user, category: @category4, outcome: true)
    FactoryGirl.create_list(:expense, 10, user: user, category: @category4, outcome: false)
  	FactoryGirl.create_list(:expense, 16, user: user, category: @category5, outcome: false)
    FactoryGirl.create_list(:expense, 18, user: user, category: @category5, outcome: true)
  	FactoryGirl.create_list(:expense, 25, user: user, category: @category6, outcome: true)
    FactoryGirl.create_list(:expense, 30, user: user, category: @category6, outcome: true)
  	FactoryGirl.create_list(:expense, 12, user: user, category: @category7, outcome: true)
    FactoryGirl.create_list(:expense, 13, user: user, category: @category7, outcome: false)
  	FactoryGirl.create_list(:expense, 5, user: user, category: @category8, outcome: false)
    FactoryGirl.create_list(:expense, 4, user: user, category: @category8, outcome: true)
  	FactoryGirl.create_list(:expense, 14, user: user, category: @category9, outcome: true)
    FactoryGirl.create_list(:expense, 14, user: user, category: @category9, outcome: false)
  	FactoryGirl.create_list(:expense, 1, user: user, category: @category10, outcome: true)
  	FactoryGirl.create_list(:expense, 4, user: user, category: @category11, outcome: true)
    FactoryGirl.create_list(:expense, 3, user: user, category: @category11, outcome: false)
  	FactoryGirl.create_list(:expense, 4, user: user, category: @category12, outcome: true)
    FactoryGirl.create_list(:expense, 2, user: user, category: @category12, outcome: true)
  	FactoryGirl.create_list(:expense, 7, user: user, category: @category13, outcome: true)
    FactoryGirl.create_list(:expense, 5, user: user, category: @category13, outcome: false)
  	FactoryGirl.create_list(:expense, 2, user: user, category: @category14, outcome: true)
    FactoryGirl.create_list(:expense, 6, user: user, category: @category14, outcome: true)
  end
 end
end