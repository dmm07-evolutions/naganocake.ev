class EndUser::HomesController < ApplicationController
  def top
  	@items_all =  Item.all
  	@genres = Genre.all
  end

  def about

  end

end
