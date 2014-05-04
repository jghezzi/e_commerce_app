class Marketplace < ActiveRecord::Base
	has_many :items
	has_many :buyers
	has_many :sellers
end
