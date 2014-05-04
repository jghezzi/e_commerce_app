class Buyer < User
	has_many :items
	has_one :seller, through: :offer
end