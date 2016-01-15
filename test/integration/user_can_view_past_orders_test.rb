require "test_helper"

class UserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "all order details are displayed" do
    user = create(:user_with_order)
    order = user.orders.first
    order_date = user.orders.first.formatted_date
    login_user(user)

    visit "/orders"
    assert page.has_content? order_date
    assert page.has_link? "View Order"
    click_on "View Order"
    assert_equal order_path(order), current_path

    assert page.has_content? order.items.first.title

    order.item_quantities.each do |_item_id, item_quantity|
      assert page.has_content? item_quantity
    end

    order.item_subtotals.each do |_title, item_price|
      assert page.has_content? item_price
    end

    assert page.has_content? order.items.last.title
    assert page.has_content? order.item_subtotals

    assert page.has_link? item.first.title
    assert page.has_link? item.last.title

    assert page.has_content? "Status: paid"
    assert page.has_content? "$500"
    assert page.has_content? order.created_at
  end

  test "retired items in a past order still link to item page" do
    skip
    user = create(:user_order_with_retired_item)
    user.orders.formatted_date
    login_user(user)

    visit "/orders"

    assert page.has_content? "Status: completed"
    assert page.has_content? order.updated_at

    assert page.has_link? item.title
    click_on item.title
    assert_equal item_show_path(item), current_path
    refute page.has_content? "Add to Duffel"
    assert_equal page.has_content? "SOLD OUT!"
  end
end
# order_status = %w(ordered, paid, cancelled, completed)
