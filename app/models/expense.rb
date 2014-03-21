class Expense < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	has_attached_file :bill, :styles => { :medium => "170x105!", :thumb => "100x100!" }, :default_url => "/images/:style/em.png"
  	validates_attachment_content_type :bill, :content_type => /\Aimage\/.*\Z/

  	validates :expense_value, numericality: true
  	validates :expense_value, :presence => { :message => "Expense value is required!" }
  	validates_length_of :description, :maximum => 40, :allow_blank => true, :message => "Description's too long! (max 40 chars)"
  	validates_date :date

end 
