class EndUser::ItemsController < ApplicationController
  # ログインしていないと入れない設定
  before_action :authenticate_customer!
  def index
  	@items = Item.all.page(params[:page]).per(6)
  	@item = Item.all
  	@genres = Genre.all
  end

  def show
  	@item = Item.find(params[:id])
    @genres = Genre.all
  	@cart_item = CartItem.new
  end


end

# praiveate等は追加しなくても他のところから取れたので動いた