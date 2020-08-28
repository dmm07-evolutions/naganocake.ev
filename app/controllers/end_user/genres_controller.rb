class EndUser::GenresController < ApplicationController
  def show
  	@genre = Genre.find(params[:id])
  	@items = Item.where(genre_id: params[:id])
  end
end
