class AdminOrdersTest < ActionDispatch::IntegrationTest
  test "an admin sees all past orders on dashboard and can filter them" do
    admin = create_admin
    login(admin)
    user_1 = create(:user_with_orders)
    user_1_order = user_1.orders.first
    user_1_order.update_attribute(:status, "canceled")
    user_2 = create(:user_with_orders)
    user_2_order = user_2.orders.last

    visit admin_dashboard_path

    within "#user-orders" do
      assert page.has_content? user_1.first_name
      assert page.has_content? user_1.last_name
      assert page.has_content? user_1_order.formatted_date
      assert page.has_content? user_1_order.total
      assert page.has_content? user_1_order.status
      assert page.has_link? "View Order"
    end

    click_on "Canceled"
    assert page.has_content? user_1_order.status
    assert page.has_content? user_1.first_name
    refute page.has_content? user_2_order.status
    refute page.has_content? user_2.first_name
  end
end
