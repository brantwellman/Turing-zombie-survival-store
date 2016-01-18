require 'test_helper'

class AdminCreatesNewItemTest < ActionDispatch::IntegrationTest
  test "newly created item created item can be seen on item index page" do
    category = Category.create(title: "Books")
    admin = create_admin
    login(admin)
    image_path = "http://www.vbdl.org/wp-content/uploads/2015/09/cartoon-zombies-373177.jpg"

    visit admin_dashboard_path
    click_on "Create New Item"
    fill_in "Title", with: "Baseball Bat"
    fill_in "Description", with: "Home run!"
    fill_in "Price", with: 20
    select "Books", from: "item[category_id]"
    click_on "Submit"

    assert_equal item_path(Item.last), current_path
    within "#item-card" do
      assert page.has_content? "Baseball Bat"
      assert page.has_content? "Home run!"
      assert page.has_css? "img[src=\"#{image_path}\"]"
    end
  end
end
