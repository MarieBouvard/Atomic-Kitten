class CartItemsController < ApplicationController

    def create
      @item_add = CartItem.add_or_create_cart_item_link(permit_link_params)
      redirect_to items_path
    end

    
    def update 
    end 

    def destroy
      @item_delete = CartItem.find(params[:id])
      @item_delete.destroy
      redirect_to cart_path
    end 

    private

    def permit_link_params
      params.require(:cart_item).permit(:item_id, :cart_id, :quantity)
    end
end
