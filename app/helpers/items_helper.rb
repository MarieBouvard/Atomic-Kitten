module ItemsHelper
    def save_items_in_cart
        if current_user != nil
            @items_in_cart = CartItem.where(cart_id:current_user.cart.id)
        end
    end

    private

    def only_admin_can_edit_and_add_pictures
        if !current_user.admin
            return redirect_to root_path
        end
    end
end