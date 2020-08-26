class Admin::CustomersController < ApplicationController

  #会員一覧ページ
  def index
  	@customers = Customer.all
  end

  #会員詳細ページ
  def show
  	@customer = Customer.find(params[:id])
  end

  #会員編集ページ
  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end


private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postcode, :address, :phone_number)
  end
end
