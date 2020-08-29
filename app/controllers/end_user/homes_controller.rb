 class EndUser::HomesController < ApplicationController
  # ログインしていないと入れない設定

  def top
  	#商品ステータスが"販売中"かつジャンルが"有効"である商品を取得
  	@items = Item.where(status: true).joins(:genre).where(genres: { is_active: true }).page(params[:page]).per(6)
  	@genres = Genre.where(is_active: true)
  end

  def about

  end
  
end
