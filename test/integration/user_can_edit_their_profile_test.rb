require "test_helper"

class UserCanEditTheirProfileTest < ActionDispatch::IntegrationTest
  test "they see updated information" do
    user = create(:user)
    login(user)

    visit dashboard_path
    assert page.has_content? "1510 Blake St"
    assert page.has_content? "80202"
    click_on "Edit Profile"

    assert_equal edit_user_path(user), current_path
    fill_in "Address", with: "3001 Walnut St"
    fill_in "Zipcode", with: "80205"

    click_on "Submit"
    assert_equal dashboard_path, current_path

    refute page.has_content? "1510 Blake St"
    assert page.has_content? "3001 Walnut St"
    assert page.has_content? "80205"
  end
end
