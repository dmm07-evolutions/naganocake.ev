class EndUser::SearchesController < ApplicationController
  def search
  	search = params[:search]
  	if search.blank?
  		flash[:nilnotice] = "※ 商品名を入力してください ※"
  	    redirect_to request.referer
  	else
  	    @items = Item.search(search)
  	end
  end
end
