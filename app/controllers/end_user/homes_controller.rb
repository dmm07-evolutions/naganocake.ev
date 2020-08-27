class EndUser::HomesController < ApplicationController
 # ログインしていないと入れない設定
  before_action :authenticate_customer!
  def top
  	@items_all =  Item.all
  	@genres = Genre.all
  end

  def about

  end

end
