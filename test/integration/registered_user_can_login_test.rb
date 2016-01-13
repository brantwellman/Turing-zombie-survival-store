require "test_helper"

class RegisteredUserCanLoginTest < ActionDispatch::IntegrationTest
  test "registered user can log back in and see their dashboard" do
    user = create(:user)

    visit root_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_link "Login"

    assert_equal dashboard_path, current_path
    assert page.has_content? "#{user.first_name user.last_name}"
    assert page.has_content? "Logged in as #{user.first_name}"
  end
end
