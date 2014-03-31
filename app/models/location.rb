class Location < ActiveRecord::Base
	has_many :expenses

	scope :finder, ->(q) { where("LOWER(name) like :q", q: "%#{q.downcase}%") }

	def as_json(options)
    	{ id: id, text: name }
  	end
end