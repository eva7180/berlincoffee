class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, required: false # needs to be set to false so OrderItem can be first created WITHOUT associating an order

  validates :quantity, numericality: {only_integer: true, greater_than: 0, less_than: 1000}
end
