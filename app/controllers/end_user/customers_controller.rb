class EndUser::CustomersController < ApplicationController
  def show
  	@customer = Customer.find(current_customer.id)
  end

  def edit_page
  end

  def exit
  	@customer = Customer.find(current_customer.id)
  	#@customer.is_deleted = "true"
  	redirect_to root_path
  end


end
