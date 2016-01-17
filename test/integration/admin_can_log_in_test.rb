require "test_helper"

class AdminCanLogInTest < ActionDispatch::IntegrationTest
  test "admin logs in and sees admin dashboard" do
    admin = create_admin
    login(admin)

    assert admin_dashboard_path, current_path
    assert page.has_content? "Admin Dashboard"
  end
end
