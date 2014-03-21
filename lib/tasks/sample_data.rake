require 'factory_girl_rails'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

  @users = FactoryGirl.create_list(:user, 4)

  @category1 = Category.create!(name: "Car")
  @category2 = Category.create!(name: "Food & Drink")
  @category3 = Category.create!(name: "Family & Personal")
  @category4 = Category.create!(name: "Bills")
  @category5 = Category.create!(name: "Entertainment")
  @category6 = Category.create!(name: "Travel")
  @category7 = Category.create!(name: "Hobbies")
  @category8 = Category.create!(name: "Home")
  @category9 = Category.create!(name: "Healthcare")
  @category10 = Category.create!(name: "Debt")
  @category11 = Category.create!(name: "Shopping")
  @category12 = Category.create!(name: "Education")
  @category13 = Category.create!(name: "Transport")
  @category14 = Category.create!(name: "Other")

  @users.each do |user|
  	FactoryGirl.create_list(:expense, 7, user: user, category: @category1)
  	FactoryGirl.create_list(:expense, 3, user: user, category: @category2)
  	FactoryGirl.create_list(:expense, 12, user: user, category: @category3)
  	FactoryGirl.create_list(:expense, 21, user: user, category: @category4)
  	FactoryGirl.create_list(:expense, 34, user: user, category: @category5)
  	FactoryGirl.create_list(:expense, 65, user: user, category: @category6)
  	FactoryGirl.create_list(:expense, 23, user: user, category: @category7)
  	FactoryGirl.create_list(:expense, 5, user: user, category: @category8)
  	FactoryGirl.create_list(:expense, 14, user: user, category: @category9)
  	FactoryGirl.create_list(:expense, 1, user: user, category: @category10)
  	FactoryGirl.create_list(:expense, 6, user: user, category: @category11)
  	FactoryGirl.create_list(:expense, 8, user: user, category: @category12)
  	FactoryGirl.create_list(:expense, 12, user: user, category: @category13)
  	FactoryGirl.create_list(:expense, 13, user: user, category: @category14)
  end
 end
end