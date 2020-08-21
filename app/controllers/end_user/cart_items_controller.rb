class EndUser::CartItemsController < ApplicationController

#ショッピングカートページ
  def index
    #ログイン中の顧客のカートない商品を取得
  	@cart_item = CartItem.where(customer_id: current_customer)
  end

#アイテム詳細ページのカートに入れるボタンを押したら実行される。
  def create
    # 新しいインスタンスの定義
  	@cart_item = CartItem.new
    # @cart_itemのcustomer_idにログイン中の顧客のIDを代入
  	@cart_item.customer_id = current_customer.id
    #@cart_itemに紐付いているitemの定義（@cart_itemのitem_idにparamsに受け取ったidを代入)
  	@cart_item.item = Item.find(params[:id])
    #@cart_itemのpuantityに数量を代入
  	@cart_item.quantity = 1
    #@cart_itemをデータベースに保存する
  	@cart_item.save
    #商品一覧ページに移行
  	redirect_to items_path
  end

#ショッピングカートページの削除ボタンを押したら実行される
  def destroy
    #選択したカート内商品のデータを受け取る
  	@cart_item = CartItem.find(params[:id])
    #受け取ったカートない商品のデータを削除する
  	@cart_item.destroy
    #ショッピングカートページに移行する
  	redirect_to cart_items_path
  end

#カートをからにするボタンを押すと実行される
  def destroy_all
    #ログイン中の顧客のカート内商品全てを取得
    @cart_item = CartItem.where(customer_id: current_customer)
    #全て削除
    @cart_item.destroy_all
    #ショッピングカートページに移行
    redirect_to cart_items_path
  end

  private

   def cart_item_params
   	params.require(:cart_item).permit(:quantity)
   end


end
