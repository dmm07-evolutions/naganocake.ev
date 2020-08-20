class EndUser::ShippingAddressesController < ApplicationController
  def index
  	@shipping_address = ShippingAddress.new
  end

  def edit
  end
end
