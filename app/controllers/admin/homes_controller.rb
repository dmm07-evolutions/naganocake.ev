class Admin::HomesController < ApplicationController


  #管理者側トップページ
  def top
  	@order = Order.where("created_at >= ?", Time.zone.now.beginning_of_day)
  end
end
