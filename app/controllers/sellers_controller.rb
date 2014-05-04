class SellersController < ApplicationController
	skip_filter :ensure_logged_in, only: [:new, :create]
	def new
		@new_seller = Seller.new
	end

	def create
		@new_seller = Seller.new(seller_params)
		if @new_seller.save 
			redirect_to new_user_path, notice: "Signup successful!"
		else
			render :new, notice: "Signup failed!"
		end
	end
	
	private

		def seller_params
			params.require(:seller).permit!
		end
end
