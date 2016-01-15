class Item < ActiveRecord::Base
  belongs_to :category
  has_many :orders, through: :order_items
  has_many :order_items
end
