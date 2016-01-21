class Item < ActiveRecord::Base
  belongs_to :category
  has_many :orders, through: :order_items
  has_many :order_items
  before_create :set_status

  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates_numericality_of :price, greater_than: 0

  def set_status
    self.status ||= "active"
  end

  def active?
    self.status == "active"
  end
end
