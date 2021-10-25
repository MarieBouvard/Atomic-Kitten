class Order < ApplicationRecord
  before_save :set_subtotal
  after_create :order_cart

  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def subtotal
    order_items.collect{|order_items| order_items.valid ? order_items.unit_price * order_items.quantity : 0}.sum
  end

  private 

  def set_subtotal
    self[:subtotal] = subtotal

  end

  def order_cart
    self.user.cart.items.each do |item|
      puts "#"*50
      puts self.user.cart.join_cart_items
      puts self.user.cart.join_cart_items.find_by(item_id: item.id)
      puts self.user.cart.join_cart_items.find_by(item_id: item.id).quantity
      puts "$"*20
      puts item.price
      puts "#"*50
      OrderItem.create(order_id: self.id, item_id: item.id, unit_price: item.price, quantity: self.user.cart.join_cart_items.find_by(item_id: item.id).quantity)
    end
    self.user.cart.items.destroy_all
  end

end
