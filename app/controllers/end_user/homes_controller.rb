class EndUser::HomesController < ApplicationController
  def top
  	@item = Item.find(params)
  end

  def about

  end
end
