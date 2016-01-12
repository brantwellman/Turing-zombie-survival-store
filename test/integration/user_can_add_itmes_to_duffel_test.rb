require "test_helper"

class UserCanAddItemsToDuffel < ActionDispatch::IntegrationTest

  test "displays item information plus total cost for all items in cart" do
    item = create(:item)

    visit items_path

    assert page.has_link? "Add to Duffel"
    click_link "Add to Duffel"
    click_link "Add to Duffel"

    assert "/duffel", current_path
    assert page.has_content? item.title
    assert page.has_content? item.description
    assert page.has_content? item.price
    assert page.has_css?("img[src='#{item.image}']")
    assert page.has_content? 3

  end
end
