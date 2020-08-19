class Admin::ItemsController < ApplicationController
  def new
  	@item = Item.new
  end

  def index
  	@items = Item.all.page(params[:page]).per(10)
  end

  def show
  	@item = Item.find(params[:id])
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def create
  	@item = Item.new(item_params)
  	@item.save
  	redirect_to admin_items_path
  end

  def update
  	@item = Item.find(params[:id])
  	@item.update
  	redirect_to admin_items_path
  end

  def destroy
  end

private

  def item_params
    params.require(:item).permit(:img, :name, :explanation, :genre, :price, :status)
  end

end
