require "test_helper"

class UserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "all order details are displayed" do
    user = User.create(
      first_name: "Penney",
      last_name: "Me",
      email: "email@email.com",
      password: "password",
      password_confirmation: "password"
    )

    order = user.orders.create(user_id: user.id)
    item_1 = order.items.create(title: "Hammer", price: 10)
    item_2 = order.items.create(title: "Ax", price: 500)
    item_3 = order.items.create(title: "Ax", price: 500)
    order_date = order.formatted_date
    
    # user = create(:user_with_order)
    # order = user.orders.first
    # order_date = order.formatted_date
    # item_1 = order.items.first
    # item_2 = order.items.last

    login_user(user)

    visit orders_path
    assert page.has_content? order_date
    assert page.has_link? "View Order"
    click_on "View Order"
    assert_equal order_path(order), current_path

    assert page.has_content? item_1.title

    order.item_quantities.map do |_item_id, item_quantity|
      assert page.has_content? item_quantity
    end

    order.item_subtotals.map do |_title, item_price|
      assert page.has_content? item_price
    end

    assert page.has_content? item_2.title
    assert page.has_content? order.item_subtotals

    assert page.has_link? item_1.title
    assert page.has_link? item_2.title

    assert page.has_content? "Status: ordered"
    assert page.has_content? "$20.00"
    assert page.has_content? order.formatted_date
  end

  # test "retired items in a past order still link to item page" do
  #   user = create(:user_with_order)
  #   order = user.orders.first
  #   item = order.items.first
  #   item.update_attribute(:status, "retired")
  #   order.update_attribute(:status, "completed")
  #
  #   login_user(user)
  #
  #   visit order_path(order)
  #
  #   assert page.has_content? "Status: completed"
  #   assert page.has_content? order.updated_at
  #
  #   assert page.has_link? item.title
  #   click_on item.title
  #   assert_equal item_path(item), current_path
  #   refute page.has_content? "Add to Duffel"
  #   assert page.has_content? "SOLD OUT!"
  # end
end
# order_status = %w(ordered, paid, cancelled, completed)
