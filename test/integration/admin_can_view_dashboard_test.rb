require 'test_helper'

class AdminCanViewDashboardTest < ActionDispatch::IntegrationTest
  test "admin can view admin dashboard" do
    admin = create_admin
    login(admin)

    assert page.has_content? "Admin Dashboard"
  end

  test "registered user can't view admin dashboard" do
    user = create(:user)
    login(user)

    visit admin_dashboard_path

    assert page.has_content? "404"
    assert page.has_content? "The page you were looking for doesn't exist."
  end

  test "visitor cannot view admin dashboard" do
    visit admin_dashboard_path

    assert page.has_content? "404"
    assert page.has_content? "The page you were looking for doesn't exist."
  end
end
