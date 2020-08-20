class EndUser::OrdersController < ApplicationController

  def new
     @order = Order.new
     @customer = current_customer
     @shipping_address = Shipping_address.find(shipping_addresss_params)
  end

  def show
    @orders = Order.all
    @ordered_items = Ordered_item.find(item_params)
    @price = (BigDecimal(@ordered_item)) * (BigDecimal("1.08"))
  end

  def thanks
  end

  def history_index
  end

  def history_show
  end


  private

  def item_params
    params.require(:item).permit(:img, :name, :explanation, :genre_id, :price, :status)
  end

  def shipping_addresss_params
    params.require(:shipping_address).permit(:postcode, :address, :destination)
  end

end
