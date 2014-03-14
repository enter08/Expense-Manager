namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Category.create!(name: "Work")
    Category.create!(name: "Fun")
    Category.create!(name: "Medicine")
    Category.create!(name: "Debt")
    Category.create!(name: "Bills")
  end
end