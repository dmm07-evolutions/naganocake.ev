class Admin::GenresController < ApplicationController
  # ログインしていないと入れない設定
  before_action :authenticate_admin!
  #ジャンル一覧ページ
  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end


 #ジャンル新規登録
  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
      flash[:notice] = "追加されました"
  	  redirect_to admin_genres_path
    else
      @genres = Genre.all
      render 'index'
    end
  end

  #ジャンル編集ページ
  def edit
  	@genre = Genre.find(params[:id])
  end

  #ジャンル編集（有効・無効設定）
  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
      flash[:notice] = "ジャンル情報を更新しました"
      CartItem.all.each do |cart_item|
        #無効にしたジャンルの商品がカートに入れられているときそのカート商品を削除する
        if cart_item.item.genre.is_active == false
          cart_item.destroy
        end
      end
      redirect_to admin_genres_path
    else
      render 'edit'
    end
  end

  private
  def genre_params
  	params.require(:genre).permit(:name, :is_active)
  end

end
