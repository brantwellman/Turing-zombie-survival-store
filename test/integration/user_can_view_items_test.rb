require "test_helper"

class UserCanViewAllItemsTest < ActionDispatch::IntegrationTest
  test "displays all items" do
    item_1, item_2 = create_list(:item, 2)

    visit "/items"

    assert page.has_content?(item_1.title)
    assert page.has_content?(item_2.title)
    assert page.has_content?(item_1.price)
    assert page.has_css?("img[src='https://www.wpclipart.com/weapons/axe/Axe_red.svg']")
  end
end
