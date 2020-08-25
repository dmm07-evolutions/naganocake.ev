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
end
