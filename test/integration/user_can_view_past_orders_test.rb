require "test_helper"

class UserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "all order details are displayed" do
    user = create(:user_with_order)
    order = user.orders.first
    order_date = user.orders.first.created_at.strftime("%B %e, %Y")
    login_user(user)

    visit "/orders"
    assert page.has_content? order_date
    assert page.has_link? "View Order"
    click_on "View Order"
    assert_equal order_path(order), current_path

    assert page.has_content? order.item.first.title
    assert page.has_content? order.item.first.quantity
    assert page.has_content? order.item.first.item_subtotal

    assert page.has_content? order.item.last.title
    assert page.has_content? order.item.last.quantity
    assert page.has_content? order.item.last.item_subtotal

    assert page.has_link? item_1.title
    assert page.has_link? item_2.title

    assert page.has_content? "Status: paid"
    assert page.has_content? "$500"
    assert page.has_content? order.created_at
  end

  test "retired items in a past order still link to item page" do
    skip
    user = create(:user_order_with_retired_item)
    user.orders.created_at.strftime("%B %e, %Y")
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
