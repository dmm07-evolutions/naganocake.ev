 class EndUser::HomesController < ApplicationController
  # ログインしていないと入れない設定

  def top
  	@items_all =  Item.all
  	@genres = Genre.all
  end

  def about

  end

  def gorilla
  end
  
end
