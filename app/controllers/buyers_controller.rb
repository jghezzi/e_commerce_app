class BuyersController < ApplicationController
	skip_filter :ensure_logged_in, only: [:new, :create]
	def new
		@new_buyer = Buyer.new
	end

	def create
		@new_buyer = Buyer.new(user_params)
		if @new_buyer.save 
			redirect_to new_user_path, notice: "Signup successful!"
		else
			render :new, notice: "Signup failed!"
		end
	end
	
	private

		def user_params
			params.require(:buyer).permit!
		end
end
