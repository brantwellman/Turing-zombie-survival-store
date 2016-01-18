require "test_helper"

class UserCanEditTheirProfileTest < ActionDispatch::IntegrationTest
  test "they see updated information" do
    user = create(:user)
    login(user)

    visit dashboard_path
    assert page.has_content? "123 Zombie Ln"
    assert page.has_content? "80121"
    click_on "Edit Profile"

    assert_equal edit_user_path(user), current_path
    fill_in "Address", with: "666 Apocalypse Blvd"
    fill_in "Zipcode", with: "80666"

    click_on "Update Profile"
    assert_equal dashboard_path, current_path

    refute page.has_content? "123 Zombie Ln"
    assert page.has_content? "666 Apocalypse Blvd"
    assert page.has_content? "80666"
  end
end
