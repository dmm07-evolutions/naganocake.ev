class EndUser::ItemsController < ApplicationController
  def index
  	@items = Item.all
  	@cart_items = CartItem.find(1)
  end

  def show
  	@item = Item.find(params[:id])
  end

 private
  def item_params
  	params.require(:item).permit(:img, :name ,:price)
  end
end
