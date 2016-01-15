class Duffel
  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def count_of(item_id)
    contents[item_id.to_s]
  end

  def duffel_items
    contents.map do |item_id, _quantity|
      Item.find(item_id)
    end
  end

  def item_subtotal(item_id)
    item = Item.find(item_id)
    contents[item_id.to_s] * item.price
  end

  def item_totals
    duffel_items.map do |item|
      item_subtotal(item.id)
    end
  end

  def cart_subtotal
    item_totals.sum
  end
end
