class OrderItemsController < ApplicationController
    before_action :set_order
    before_action :set_total

    def create
        @order = current_order
        @order_item = @order.order_items.new(order_params)
        @order.save
        session[:order_id] = @order.id
    end

    def update
        @order_item = @order.order_items.find(params[:id])
        @order_item.update_attributes(order_params)
        @order_items = current_order.order_items
    end

    def destroy
        @order_item = @order.order_items.find(params[:id])
        @order_item.destroy
        @order_items = current_order.order_items
    end

    def set_order
        @order = current_order
    end

    def set_total
        self[:total] = total * quantity
    end

 
    private

    def order_params
        params.require(:order_item).permit(:product_id, :quantity)
    end
end
