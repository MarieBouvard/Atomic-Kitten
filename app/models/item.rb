class Item < ApplicationRecord
  validate :title
  validate :description
  validate :price

  has_one_attached :image_url
  validate :image_url

  has_many :cart_items
  has_many :cart
  has_many :order_items
  has_many :order

  def join_id(user)
    self.join_cart_items.where(cart: user.cart.id)
  end

  def quantity(id)
    self.join_cart_items.find_by(cart_id:id).quantity
  end
end
