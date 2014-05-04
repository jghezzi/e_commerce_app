class ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def new
		@new_item = Item.new
		@new_item.build_offer
	end

	def create
		@new_item = Item.new(item_params)
		if @new_item.save
			redirect_to items_path
		else
			render new_item_path
		end
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update_attributes(item_params)
			redirect_to items_path
		else
			render edit_item_path
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to items_path
	end

	def buy
		@item = Item.find(params[:id])
	end

	def add_to_cart
		@item = Item.find(params[:id])
		@item.update_attributes(:status => "IN CART", :buyer_id => @current_user.id)
		redirect_to items_path
	end

	def checkout
		@items = Item.all
	end

	def pay
		@items = Item.update_all("status = 'SOLD' WHERE buyer_id = #{current_user.id} AND status = 'IN CART'")
			redirect_to items_path
	end

	private

	def item_params
		params.require(:item).permit(:name, :price, :status, :user_id, offer_attributes: [:item_id, :seller_id, :buyer_id])
	end

end
