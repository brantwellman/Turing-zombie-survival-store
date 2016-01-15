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
    updated_at if status == "completed" || status == "cancelled"
  end

  def formatted_date
    created_at.strftime("%B %e, %Y")
  end

  def item_quantities
    items.group(:title).count
  end

  def item_subtotals
    items.group(:title).sum(:price)
  end

  def total
    item_subtotals.values.sum
  end
end
