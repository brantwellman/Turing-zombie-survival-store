require "date"

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :order_items
  has_many :order_items
  before_create :set_status
  scope :ordered, -> { where(status: "ordered") }
  scope :paid, -> { where(status: "paid") }
  scope :canceled, -> { where(status: "canceled") }
  scope :completed, -> { where(status: "completed") }

  def set_status
    self.status ||= "ordered"
  end

  def show_updated_status
    updated_at.strftime("%B %e, %Y") if order_closed?
  end

  def order_closed?
    status == "completed" || status == "canceled"
  end

  def formatted_date
    created_at.strftime("%B %e, %Y")
  end

  def item_quantities
    quantities = {}
    order_items.each do |ord_item|
      quantities[ord_item.item.title] = ord_item.quantity
    end
    quantities
  end

  def item_quantity(item_id)
    order_items.find_by(item_id: item_id).quantity
  end

  def item_subtotals
    items.map do |item|
      item_subtotal(item.id)
    end
  end

  def item_subtotal(item_id)
    item = Item.find(item_id)
    order_item = order_items.find_by(item_id: item_id)
    item.price * order_item.quantity
  end

  def total
    item_subtotals.sum
  end

  def self.filter_orders(status)
    where(status: status)
  end

  def self.set_status_breakdown
    group(:status).count
  end
end
