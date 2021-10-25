class CartsController < ApplicationController
  include CartsHelper
  before_action :require_login
  before_action :only_current_cart
  
    def show
      @items_in_cart = CartItem.where(cart_id:current_user.cart.id)
    end

    def create
    end

    def update
      CartItem.create(cart_id: @cart.id, 
                          item_id: Item.find(params[:id]).id, 
                          quantity: params[:quantity])
  
      respond_to do |format|
        format.js {}
        format.html { render 'new'}
      end
    end
  
    def destroy
      item = Item.find(params[:id])
      CartItem.find_by(cart_id: @cart.id, item_id: item.id).destroy
      respond_to do |format|
        format.js  
      end
    end

    def is_in_cart?(id)
      self.cart_items.find_by(cart_id: self.id, item_id: id)
    end

    private

    def cart_params
      params.require(:cart).permit(:user_id, :id)
    end

end