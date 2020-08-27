class Admin::HomesController < ApplicationController
  # ログインしていないと入れない設定
  before_action :authenticate_admin!

  #管理者側トップページ
  def top
  	@order = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
