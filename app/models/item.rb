class Item < ApplicationRecord
  validate :name
  validate :description
  validate :price

  has_one_attached :image_url
  validate :image_url
  

  has_many :join_table_items_carts, dependent: :nullify
  has_many :order_items
  
  def join_id(user)
    self.join_cart_items.where(cart: user.cart.id)
  end

  def quantity(id)
    self.join_cart_items.find_by(cart_id:id).quantity
  end
end
