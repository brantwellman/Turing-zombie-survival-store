require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "formatted date formats the date" do
    order = Order.create
    time = Time.zone.now
    assert_equal time.strftime("%B %e, %Y"), order.formatted_date
  end

  test "item quantities method returns a quantity hash" do
    order = Order.create
    order.items.create(title: "Hammer", description: "Hits", price: 2)
    ord_item = order.order_items.first
    ord_item.update_attribute(:quantity, 2)
    order.items.create(
      title: "Bruised Apple",
      description: "Tastes good",
      price: 1
    )

    assert_equal({ "Bruised Apple" => 1, "Hammer" => 2 }, order.item_quantities)
  end

  test "item subtotal method returns subtotal of each different item" do
    order = Order.create
    order.items.create(title: "Hammer", price: 10, description: "Hits")
    ord_item = order.order_items.first
    ord_item.update_attribute(:quantity, 2)
    order.items.create(
      title: "Bruised Apple",
      price: 2,
      description: "Tastes good"
    )

    assert_equal([2, 20], order.item_subtotals.sort)
  end

  test "returns sum of all subtotals" do
    order = Order.create
    order.items.create(
      title: "Hammer",
      price: 10,
      description: "Hits"
    )
    ord_item = order.order_items.first
    ord_item.update_attribute(:quantity, 2)
    order.items.create(
      title: "Bruised Apple",
      price: 2,
      description: "Tastes good"
    )

    assert_equal 22, order.total
  end

  test "resets status of order" do
    order = Order.create

    assert_equal "ordered", order.status

    order.update_attribute(:status, "completed")

    assert_equal "completed", order.status
  end
end
