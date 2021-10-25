class OrderItem < ApplicationRecord
  belongs_to :item 
  belongs_to :order
  before_save :set_unit_price
  

  def unit_price
    if persisted?
        self[:unit_price]
    else
      product.price
    end
  end

  def total
    return unit_price * quantity
  end

  private

  def set_unit_price
    self[:unit_price] = unit_price
  end

end
