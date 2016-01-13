class Duffel
  attr_reader :contents

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

  def subtotal
    item_prices = contents.map do |item_id, quantity|
      item = Item.find(item_id)
      item.price * quantity
    end
    item_prices.sum
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
end
