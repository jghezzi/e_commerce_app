class Offer < ActiveRecord::Base
	belongs_to :item
	has_one :buyer
	has_one :seller
end