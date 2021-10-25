class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :item, foreign_key: true
      t.belongs_to :order, foreign_key: true
      t.decimal :total
      t.decimal :unit_price
      t.integer :quantity
      t.timestamps
    end
  end
end
