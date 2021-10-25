class Cart < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  has_many :join_table_items_carts
    

    def in_cart
      self.items
    end

    def total
      self.join_cart_items.map{ |item| item.total }.sum
    end

    def is_in_cart?(id)
      self.join_cart_items.find_by(cart_id: self.id, item_id: id)
    end
end
