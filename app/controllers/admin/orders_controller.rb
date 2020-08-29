class Admin::OrdersController < ApplicationController
  # ログインしていないと入れない設定
  before_action :authenticate_admin!
  def index
    if params[:customer_id]
      customer = Customer.find(params[:customer_id])
      @orders = customer.orders
    else
      @orders = Order.all
    end
  end

  def show
  	@order = Order.find(params[:id])
  end

  #制作ステータス更新
  def update_production
  	@ordered_item = OrderedItem.find(params[:id])
    @order = @ordered_item.order
  	@ordered_item.update(production_params)
    #制作ステータスが制作中に変更された時注文ステータスを製作中に変更する
    if @ordered_item.production_status == "製作中"
      @order.status = 2
      @order.save
    end
    #注文内全ての商品の制作ステータスが制作鑑賞になった時注文ステータスを発送準備にする
    catch :done do
      if @ordered_item.production_status == "製作完了"
        @order.ordered_items.each do |ordered_item|
          if ordered_item.production_status != "製作完了"
            throw :done
          end
        end
        @order.status = 3
        @order.save
      end
    end
    #注文詳細ページに遷移
  	redirect_to admin_order_path(@ordered_item.order.id)
  end

  #注文ステータス更新
  def update_status
    @order = Order.find(params[:id])
    @order.update(status_params)
    #注文ステータスを入金確認に変更した時制作ステータスを製作中に変更する
    if @order.status == "入金確認"
      @order.ordered_items.each do |ordered_item|
        ordered_item.production_status = "製作待ち"
        ordered_item.save
    

      end
    end
    #注文詳細ページに遷移
    redirect_to admin_order_path(@order.id)
  end



  private
    #制作ステータス更新
  	def production_params
  		params.require(:ordered_item).permit(:production_status)
  	end

    #注文ステータス更新
    def status_params
      params.require(:order).permit(:status)
    end



end
