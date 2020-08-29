class Admin::ItemsController < ApplicationController
  # ログインしていないと入れない設定
  before_action :authenticate_admin!
  #商品新規登録ページ
  def new
  	@item = Item.new
  end

  #商品一覧ページ
  def index
  	@items = Item.all.page(params[:page]).per(10)
  end

  #商品詳細ページ
  def show
  	@item = Item.find(params[:id])
  end

  #商品編集ページ
  def edit
  	@item = Item.find(params[:id])
  end

  #商品新規登録
  def create
  	@item = Item.new(item_params)
  	if @item.save
      flash[:notice] = "商品を追加しました"
      #商品詳細ページに遷移
    	redirect_to admin_item_path(@item.id)
    else
      render 'new'
    end
  end

  #商品編集
  def update
  	@item = Item.find(params[:id])
  	@item.update(item_params)
    #商品一覧ページに遷移
  	redirect_to admin_items_path
  end

  #商品削除
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    #商品一覧ページに遷移
    redirect_to admin_items_path
  end

private

  def item_params
    params.require(:item).permit(:img, :name, :explanation, :genre_id, :price, :status)
  end

end
