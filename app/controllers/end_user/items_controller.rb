class EndUser::ItemsController < ApplicationController
 
  def index
    #商品ステータスが"販売中"かつジャンルが"有効"である商品を取得
  	@items = Item.where(status: true).joins(:genre).where(genres: { is_active: true }).page(params[:page]).per(6)
  	@genres = Genre.where(is_active: true)
  end

  def show
  	@item = Item.find(params[:id])
    @genres = Genre.where(is_active: true)
  	@cart_item = CartItem.new
  end


end

# praiveate等は追加しなくても他のところから取れたので動いた