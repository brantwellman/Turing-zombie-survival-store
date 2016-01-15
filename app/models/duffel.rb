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

  def update_quantity(function, item_id)
    case function
    when "add"
      contents[item_id] += 1
    when "subtract"
      contents[item_id] -= 1
      if contents[item_id] <= 0
        self.contents = contents.except(item_id)
      end
    when "remove"
      self.contents = contents.except(item_id)
    end
  end
end
