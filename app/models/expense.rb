class Expense < ActiveRecord::Base
	searchkick
	belongs_to :user
	belongs_to :category
  belongs_to :location

	has_attached_file :bill, :styles => { :medium => "170x105!", :thumb => "100x100!" }, :default_url => "/images/:style/em.png"
	validates_attachment_content_type :bill, :content_type => /\Aimage\/.*\Z/

	validates :user_id, presence: true
  validates :category_id, presence: true
	validates :expense_value, numericality: true
	validates :expense_value, :presence => { :message => "Expense value is required!" }
	validates_length_of :description, :maximum => 40, :allow_blank => true, :message => "Description's too long! (max 40 chars)"
	validates_date :date

	def self.total_grouped_by_day(start)
		expenses = where(date: start..Time.zone.now)
		expenses = expenses.select("date, sum(expense_value) as total_expense").group("date(date)")
		expenses.group_by { |o| o.date.to_date }
	end

	def self.total_grouped_by_day2(start)
	  expenses = where(date: start..Time.zone.now)
	  expenses = expenses.select("date, sum(expense_value) as total_expense").group("date(date)")
	  expenses.group_by { |o| o.date.to_date }
	end

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |expense|
				csv << expense.attributes.values_at(*column_names)
			end
		end
	end
end 
