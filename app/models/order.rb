require "date"

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, through: :order_items
  has_many :order_items

  def formatted_date
    created_at.strftime("%B %e, %Y")
  end

  def item_quantities
    self.items.group(:title).count
  end

  def item_subtotals
    self.items.group(:title).sum(:price)
  end
end
