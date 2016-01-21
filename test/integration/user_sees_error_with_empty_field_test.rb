require "test_helper"

class UserSeesErrorWithIncorrectFieldTest < ActionDispatch::IntegrationTest
  test "user does not provide email" do
    visit new_user_path

    fill_in "First name", with: "Penney"
    fill_in "Last name", with: "Gadget"
    fill_in "Address", with: "3001 Walnut St"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zipcode", with: "80205"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Submit"

    assert page.has_content? "Email can't be blank"
    assert_equal users_path, current_path
  end

  test "password must be correct" do
    user = create(:user)

    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "wrongpassword"
    click_button "Login"

    assert page.has_content? "Your email or password is incorrect"
    assert_equal login_path, current_path
  end
end
