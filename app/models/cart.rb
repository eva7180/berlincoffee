class Cart < ApplicationRecord
  has_many :order_items
  has_many :products, through: :order_items
  belongs_to :user, required: false
  before_save :update_total
  before_create :update_status

  def calculate_total
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  def items_count
    Rails.cache.fetch([cache_key, __method__]) do
      order_items.count
    end
  end

  private

  def update_status
    if self.status == nil?
      self.status = "brewing..."
    end
  end

  def update_total
    self.total_price = calculate_total
  end

end
