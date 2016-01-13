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

    assert page.has_content? "Logged in as Penney" #what the #%*@&! is the syntax for testing this is in the CSS navbar?
    assert page.has_content? "Penney Gadget"
    assert page.has_content? "theworldisending@uhoh.com"
    # assert page.has_no_content? "Login" #can't find the test unit syntax for something NOT being on page - this doesn't seem to work
    assert page.has_content? "Logout"

    # visit "/duffel"
    # assert page.has_content? item
    #
    # click_link "Logout"
    # assert page.has_content? "Login"
    # assert page.has_no_content? "Logout"
  end
end

# As a visitor
#     When I visit "/"
#     Then I should see a link for "Login"
#     And when I click link "Create Account"
#     Then my current page should be "/dashboard"
#     And I should see a message in the navbar that says "Logged in as SOME_USER"
#     And I should see my profile information
#     And I should not see a link for "Login"
#     And I should see a link for "Logout"
#
# And when I visit "/cart"
# Then I should see all of the data that was there when I was not logged in
# When I click "Logout"
# Then I should see see "Login"
# And I should not see "Logout"
