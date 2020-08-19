class EndUser::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  end

 private
  def item_params
  	params.require(:item).permit(:img, :name ,:price)
  end
end
