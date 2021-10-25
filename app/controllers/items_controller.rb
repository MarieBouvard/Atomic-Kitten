class ItemsController < ApplicationController
    include ItemsHelper
    before_action :save_items_in_cart
    before_action :authenticate_user!, except: [:show, :index]
    before_action :only_admin_can_edit_and_add_pictures, only: [:edit, :update, :new, :create]
    
    def index
      @items = Item.all
      @cart_item = CartItem.new
    end
  
    def show
      @item = Item.find(params[:id])
      @cart_item= CartItem.new
    end
  
    def new
      @item = Item.new
    end
  
    def create
      item = Item.create(item_params)
      redirect_to item_path(item.id)
  
    end
  
    def edit
      @item = Item.find(params[:id])
    end 
   
    def update
      @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to item_path(@item.id)
    end
    
  
    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      redirect_to items_path
    end
  
  
    private 
  
    def item_params
      params.require(:item).permit(:title, :description, :price, :image_url)
    end
  
  end
  