class EndUser::SearchesController < ApplicationController
  def search
  	search = params[:search]
  	@items = Item.search(search)
  end
end
