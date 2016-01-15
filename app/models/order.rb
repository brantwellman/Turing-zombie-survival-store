require "date"

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :order_items
  has_many :order_items
  before_create :set_status

  def set_status
    self.status ||= "ordered"
  end

  def show_updated_status
    self.updated_at if status == "completed" || status == "cancelled"
  end

  def formatted_date
    created_at.strftime("%B %e, %Y")
  end

  def item_quantities
    self.items.group(:title).count
  end

  def item_subtotals
    self.items.group(:title).sum(:price)
  end

  def item_subtotal(item_id)
    item = Item.find(item_id)
    order_item = self.order_items.find_by(item_id: item_id)
    binding.pry
    item.price * order_item.quantity
  end

  def total
    item_subtotals.values.sum
  end
end
