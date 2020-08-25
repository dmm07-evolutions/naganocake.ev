class Admin::OrdersController < ApplicationController

  def index
  	 @orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  end

  #制作ステータス更新
  def update_production
  	@ordered_item = OrderedItem.find(params[:id])
    @order = @ordered_item.order
  	@ordered_item.update(production_params)
    #制作ステータスが入金確認
    if @ordered_item.production_status == 2
      @order.status = 2
      @order.save
    end
    catch :done do
      if @ordered_item.production_status == 3
        @order.ordered_items.each do |ordered_item|
          if ordered_item.production_status == 3
            @order.status = 3
          else
            throw :done
          end
        end
        @order.save
      end
    end
  	redirect_to admin_order_path(@ordered_item.order.id)
  end

  def update_status
    @order = Order.find(params[:id])
    @order.update(status_params)
    if @order.status == 1
      @order.ordered_items.each do |ordered_item|
        ordered_item.production_status = 1
        ordered_item.save
      end
    end
    redirect_to admin_order_path(@order.id)
  end



  private

  	def production_params
  		params.require(:ordered_item).permit(:production_status)
  	end

    def status_params
      params.require(:order).permit(:status)
    end



end
