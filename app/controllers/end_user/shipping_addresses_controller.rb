class EndUser::ShippingAddressesController < ApplicationController
  def index
  	@shipping_address = ShippingAddress.new
  end

  def create
  	@shipping_address = ShippingAddress.new(shipping_address_params)
  	@shipping_address.customer_id = current_customer.id
  	@shipping_address.save
  	redirect_to request.referer
  end

  def edit
  end

  private
  def shipping_address_params
  	params.require(:shipping_address).permit(:postcode, :address, :destination)
  end
end
