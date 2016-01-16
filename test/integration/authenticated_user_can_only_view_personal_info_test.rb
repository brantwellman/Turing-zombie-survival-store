require "test_helper"

class UserCanOnlyViewPersonalInfoTest < ActionDispatch::IntegrationTest
  test "authenticated user cannot access another user's info" do
    user_1 = create(:user_with_order)
    order = user_1.orders.last
    user_2 = create(:user)

    login(user_2)
    visit dashboard_path(user_1)

    refute page.has_link? "View Order"
    refute page.has_content? order.formatted_date
  end

  test "authenticated user cannot access admin dashboard" do
    user = create(:user_with_order)
    create_admin

    login(user)
    visit admin_dashboard_path

    assert page.has_content? "404"
    assert page.has_content? "The page you were looking for doesn't exist."

  end

  test "authenticated user cannot make self an admin" do

  end

end
