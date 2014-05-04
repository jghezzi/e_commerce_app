class Item < ActiveRecord::Base
	belongs_to :seller
	has_one :buyer, through: :offer
	has_one :offer, dependent: :destroy

	accepts_nested_attributes_for :offer
end	