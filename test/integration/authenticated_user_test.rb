require "test_helper"

class AuthenticatedUserTest < ActionDispatch::IntegrationTest
  test "a user can create an account and then sees logout button" do
    item = create(:item)
    visit items_path
    click_link "Add to Duffel"

    visit "/"
    assert page.has_content? "Login"

    click_link "Create Account"
    fill_in "First name", with: "Penney"
    fill_in "Last name", with: "Gadget"
    fill_in "Address", with: "123 Zombie Lane"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zipcode", with: "80121"
    fill_in "Email", with: "theworldisending@uhoh.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_link_or_button "Submit"

    assert_equal "/dashboard", current_path

    assert page.has_content? "Logged in as Penney" #assert this is in a CSS div
    assert page.has_content? "Penney Gadget"
    assert page.has_content? "theworldisending@uhoh.com"
    refute page.has_content? "Login"
    assert page.has_content? "Logout"

    visit "/duffel"
    assert page.has_content? item.title

    click_link "Logout"
    assert page.has_content? "Login"
    refute page.has_content? "Logout"
  end
end
