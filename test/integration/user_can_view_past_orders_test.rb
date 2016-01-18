require "test_helper"

class UserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "all order details are displayed" do
    user = create(:user)
    item_1 = Item.create(title: "Hammer", price: 10, description: "It hits")
    item_2 = Item.create(title: "Ax", price: 500, description: "It cuts")
    login(user)

    visit item_path(item_1)
    click_on "Add to Duffel"
    visit item_path(item_2)
    click_on "Add to Duffel"
    visit item_path(item_2)
    click_on "Add to Duffel"

    visit duffel_path
    click_on "Checkout"

    order = user.orders.all.first
    order_date = order.formatted_date

    visit orders_path

    assert page.has_content? order_date
    assert page.has_link? "View Order"
    click_on "View Order"
    assert_equal order_path(order), current_path

    assert page.has_content? item_1.title
    assert page.has_content? item_2.title

    order.order_items.each do |order_item|
      assert page.has_content? order_item.quantity
    end

    order.item_subtotals.each do |item_subtotal|
      assert page.has_content? number_to_currency(item_subtotal)
    end

    assert page.has_link? item_1.title
    assert page.has_link? item_2.title

    assert page.has_content? "Status: ordered"
    assert page.has_content? number_to_currency(order.total)
    assert page.has_content? order.formatted_date
  end

  test "retired items in a past order still link to item page" do
    user = create(:user_with_order)
    order = user.orders.first
    item = order.items.first
    item.update_attribute(:status, "retired")
    order.update_attribute(:status, "completed")

    login(user)

    visit order_path(order)

    assert page.has_content? "Status: completed"
    assert page.has_content? order.show_updated_status

    assert page.has_link? item.title
    click_on item.title
    assert_equal item_path(item), current_path
    refute page.has_content? "Add to Duffel"
    assert page.has_content? "SOLD OUT!"
  end
end
