require "test_helper"

class UserCanCheckoutOrder < ActionDispatch::IntegrationTest
  test "user can create an order" do
    user = create(:user)
    create(:item)

    visit items_path
    click_on "Add to Duffel"
    click_on "Add to Duffel"
    visit duffel_path
    click_on "Checkout"

    assert_equal login_path, current_path

    login(user)

    assert_equal duffel_path, current_path

    click_on "Checkout"

    order = user.orders.last

    assert_equal orders_path, current_path
    assert page.has_content? "Order was successfully placed."
    assert page.has_content? order.formatted_date
    assert page.has_link? "View Order"
    assert page.has_content? order.total
    assert_equal order.status, "ordered"
  end

  test "unregistered user redirects back to duffel after creating an account" do
    create(:item)

    visit items_path
    click_on "Add to Duffel"
    click_on "Add to Duffel"
    visit duffel_path
    click_on "Checkout"

    assert_equal login_path, current_path

    within ".create-acct" do
      click_on "Save yourself"
    end
    fill_in "First name", with: "Penney"
    fill_in "Last name", with: "Gadget"
    fill_in "Address", with: "1510 Blake St"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zipcode", with: "80202"
    fill_in "Email", with: "theworldisending@uhoh.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_link_or_button "Submit"

    assert_equal duffel_path, current_path
  end
end
