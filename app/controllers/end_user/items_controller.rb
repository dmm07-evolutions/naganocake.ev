class EndUser::ItemsController < ApplicationController
  def index
  	@items = Item.all.page(params[:page]).per(6)
  	@item = Item.all
  	@genres = Genre.all
  end

  def show
  	@item = Item.find(params[:id])

  	@cart_item = CartItem.new
  end


end

# praiveate等は追加しなくても他のところから取れたので動いた