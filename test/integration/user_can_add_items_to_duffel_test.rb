require "test_helper"

class UserCanAddItemsToDuffel < ActionDispatch::IntegrationTest

  test "displays item information plus total cost for all items in cart" do
    item = create(:item)

    visit items_path

    assert page.has_link? "Add to Duffel"
    click_link "Add to Duffel"
    click_link "Add to Duffel"
    click_link "My Duffel"

    assert "/duffel", current_path

    assert page.has_content? item.title
    assert page.has_content? item.description
    assert page.has_content? number_to_currency(item.price)
    assert page.has_css?("img[src='#{item.image}']")
    within ".order-subtotal" do
      assert page.has_content? number_to_currency(item.price.to_i * 2)
    end
  end
end
