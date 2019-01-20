class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart
  belongs_to :order, required: false # needs to be set to false so OrderItem can be first created WITHOUT associating an order
end
