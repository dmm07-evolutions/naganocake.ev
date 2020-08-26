class EndUser::ShippingAddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
  	@shipping_address = ShippingAddress.new
  	@shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
    #@shipping_address = current_customer.shippingAddresses
  end

  def create
  	@shipping_address = ShippingAddress.new(shipping_address_params)
  	@shipping_address.customer_id = current_customer.id
  	@shipping_address.save
  	redirect_to request.referer
  end

  def edit
  	@shipping_address = ShippingAddress.find(params[:id])
  end

  def update
  	@shipping_address = ShippingAddress.find(params[:id])
  	@shipping_address.update(shipping_address_params)
  	redirect_to shipping_addresses_path
  end

  def destroy
  	@shipping_address = ShippingAddress.find(params[:id])
  	@shipping_address.destroy
  	redirect_to request.referer
  end

  private
  def shipping_address_params
  	params.require(:shipping_address).permit(:postcode, :address, :destination)
  end
end
