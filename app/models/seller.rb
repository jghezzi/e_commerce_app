class Seller < User
	has_many :items
	has_one :buyer, through: :offer
end