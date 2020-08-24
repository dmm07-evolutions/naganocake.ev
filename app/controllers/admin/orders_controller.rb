class Admin::OrdersController < ApplicationController

  def index
  	 @orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  	@ordered_item = OrderedItem.find(params[:id])
  	@ordered_item.update(status_params)
  	redirect_to admin_order_path(@ordered_item.order.id)
  end



  private

  	def status_params
  		params.require(:ordered_item).permit(:production_status)
  	end



end
