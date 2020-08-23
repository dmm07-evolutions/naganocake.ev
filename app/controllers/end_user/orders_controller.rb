class EndUser::OrdersController < ApplicationController

  def new
     @order = Order.new
     @customer = current_customer
     @shipping_address = ShippingAddress.where(customer_id: current_customer.id)
  end


  #確認画面へ進む
  def confirm
    #ログイン中の顧客のカート内商品を取得
    @cart_items = CartItem.where(customer_id: current_customer)
    #送料の定義
    @postage = 800
    #新しいインスタンスを作成しorder_paramsで取得したデータを代入
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method].to_i
    #@orderのcustomer_idにログイン中の顧客のIDを代入
    @order.customer = current_customer
    #@orderのshipping_costに送料を代入
    @order.shipping_cost = @postage
    #@orderのtotal_peymentに請求金額を代入
    @order.total_payment = 1000
  end

  def create
  end

  def thanks
  end

  def history_index
  end

  def history_show
  end


  private

#form_forから送られてくるデータ
  def order_params
  #:address_selectの値で処理を分岐させる

    #ご自身の住所を選択しいた場合の処理
    if params[:order][:address_select] == "0"
      #ログイン中の顧客の登録情報からデータを取得する
      @customer = Customer.find(current_customer.id)
      {postal_code: @customer.postcode, address: @customer.address, name: @customer.first_name}

    #登録済住所から選択した場合の処理
    elsif params[:order][:address_select] == "1"
      #ドロップダウンで選択した住所のデータを取得する
      attrs = params[:order][:order_address].split(" ")
      {postal_code: attrs[0], address: attrs[1], name: attrs[2]}

    #新しいお届け先を選択した場合の処理
    elsif params[:order][:address_select] == "2"
      #フォームで入力したデータを取得する
      attrs = [:postal_code, :address, :name]
      params.require(:order).permit(attrs)
    end
  end

  #請求金額を計算する
  def total_cost
    @cart_items.each do |cart_item|
      total = 0
      total += cart_item.subtotal
      total
    end
  end



end
