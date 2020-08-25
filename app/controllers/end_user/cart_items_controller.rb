class EndUser::CartItemsController < ApplicationController

#ショッピングカートページ
  def index
    #ログイン中の顧客のカートない商品を取得
  	#@cart_item = CartItem.where(customer_id: current_customer)
    @cart_items = current_customer.cart_items
    @numbers = [0, 1, 2, 3, 4, 5]
  end

#アイテム詳細ページのカートに入れるボタンを押したら実行される。
  def create
    # 新しいインスタンスを定義し、form_forから持ってきたデータを代入
  	@cart_item = CartItem.new(cart_item_params)
    # @cart_itemのcustomer_idにログイン中の顧客のIDを代入
  	@cart_item.customer_id = current_customer.id
    #@cart_itemに紐付いているitemの定義（@cart_itemのitem_idにparamsに受け取ったidを代入)
  	@cart_item.item = Item.find(params[:id])
    #@cart_itemをデータベースに保存する
  	@cart_item.save
    #商品一覧ページに移行
  	redirect_to cart_items_path
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

  def quantity
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_quantity)
    redirect_to cart_items_path
  end

  private
#form_forから受け取るデータ数量（quantuty)
   def cart_item_params
   	params.require(:cart_item).permit(:quantity)
   end

   def cart_item_quantity
    params.require(:cart_item).permit(:quantity)
   end


end
