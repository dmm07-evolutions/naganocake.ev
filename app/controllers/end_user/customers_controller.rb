class EndUser::CustomersController < ApplicationController
  # ログインしていないと入れない設定
  before_action :authenticate_customer!

#マイページ
  def show
    #マイページにログイン中のユーザーの情報を渡す
  	@customer = Customer.find(current_customer.id)
  end

#退会手続きページ
  def exit_page
  end

#退会処理
  def exit
  	@customer = Customer.find(current_customer.id)
  	@customer.is_deleted = true
  	@customer.save
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
  	redirect_to root_path
  end
end
