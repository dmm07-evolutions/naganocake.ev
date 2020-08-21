class EndUser::CartItemsController < ApplicationController

  def index
  	@cart_item = CartItem.find_by(customer_id: current_customer)
  end

  def create
  	@cart_item = CartItem.new
  	@cart_item.customer_id = current_customer.id
  	@cart_item.item = Item.find(params[:id])
  	@cart_item.quantity = 1
  	@cart_item.save

  	# if @cart_item.blank?
  	# 	@cart_item = current_cart.cart_items.build(item_id: params[:id])
  	# end
  	# @cart_item.quantity += params[:quantity].to_i
  	# @cart_item.save
  	 redirect_to items_path
  end

  def destory
  	@cart_item = CartItem.find(params[:id])
  	@cart_item.destroy
  	redirect_to cart_items_path
  end

  private

   def cart_item_params
   	params.require(:cart_item).permit(:quantity)
   end


end
