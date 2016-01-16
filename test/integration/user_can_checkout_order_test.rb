require "test_helper"

class UserCanCheckoutOrder < ActionDispatch::IntegrationTest
  test "user can create an order" do
    user = create(:user)
    create(:item)

    visit items_path
    click_on "Add to Duffel"
    click_on "Add to Duffel"
    visit duffel_path
    click_on "Checkout"

    assert_equal login_path, current_path

    login(user)
    visit duffel_path
    click_on "Checkout"

    order = user.orders.last

    assert_equal orders_path, current_path
    assert page.has_content? "Order was successfully placed."
    assert page.has_content? order.formatted_date
    assert page.has_link? "View Order"
    assert page.has_content? order.total
    assert_equal order.status, "ordered"
  end
end
