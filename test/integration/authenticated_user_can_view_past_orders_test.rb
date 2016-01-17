require "test_helper"

class AuthenticatedUserViewsPastOrdersTest < ActionDispatch::IntegrationTest
  test "displays item information plus total cost for all items in cart" do
    user = create(:user_with_orders)
    login(user)

    visit "/orders"

    assert page.has_content? user.orders.first.created_at.strftime("%B %e, %Y")
    assert page.has_content? user.orders.last.created_at.strftime("%B %e, %Y")
  end
end
