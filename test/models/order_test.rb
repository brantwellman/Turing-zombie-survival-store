require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "formatted date formats the date" do
    skip
  end

  test "item quantities method returns a quantity hash" do
    order = Order.create
    order.items.create(title: "Hammer")
    order.items.create(title: "Hammer")
    order.items.create(title: "Bruised Apple")

    assert_equal({"Bruised Apple" => 1, "Hammer" => 2}, order.item_quantities)
  end

  test "item subtotal method returns subtotal of each different item" do
    order = Order.create
    order.items.create(title: "Hammer", price: 10)
    order.items.create(title: "Hammer", price: 10)
    order.items.create(title: "Bruised Apple", price: 2)

    assert_equal({"Bruised Apple" => 2, "Hammer" => 20}, order.item_subtotals)
  end
end
