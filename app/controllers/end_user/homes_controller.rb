class EndUser::HomesController < ApplicationController
  def top
  	@items_all =  Item.all
  end

  def about

  end

end
