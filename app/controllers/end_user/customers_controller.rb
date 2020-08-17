class EndUser::CustomersController < ApplicationController
  def show
  	@customers = Customer.find_by(current_customer)
  end

  def edit
  end

  def exit_page
  end
end
