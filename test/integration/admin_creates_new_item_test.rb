require "test_helper"

class AdminCreatesNewItemTest < ActionDispatch::IntegrationTest
  test "newly created item created item can be seen on item index page" do
    Category.create(title: "Books")
    admin = create_admin
    login(admin)
    default_image =
      "http://www.vbdl.org/wp-content/uploads/2015/09/cartoon-zombies-373177.jpg"
    visit admin_dashboard_path
    click_on "Create New Item"
    fill_in "Title", with: "Baseball Bat"
    fill_in "Description", with: "Home run!"
    fill_in "Price", with: 20
    select "Books", from: "item[category_id]"
    click_on "Submit"

    assert_equal item_path(Item.last), current_path
    within "#item-show" do
      assert page.has_content? "Baseball Bat"
      assert page.has_content? "Home run!"
      assert page.has_css? "img[src=\"#{default_image}\"]"
    end
  end

  test "admin can upload image with new item" do
    Category.create(title: "Books")
    admin = create_admin
    login(admin)
    default_image =
      "http://www.vbdl.org/wp-content/uploads/2015/09/cartoon-zombies-373177.jpg"
    item_image =
      "http://i465.photobucket.com/albums/rr16/xXswampyXx/BaseballBatNNails3_zps9660d65c.jpg"

    visit admin_dashboard_path
    click_on "Create New Item"
    fill_in "Title", with: "Baseball Bat"
    fill_in "Image", with: item_image
    fill_in "Description", with: "Home run!"
    fill_in "Price", with: 20
    select "Books", from: "item[category_id]"
    click_on "Submit"

    assert_equal item_path(Item.last), current_path
    within "#item-show" do
      assert page.has_content? "Baseball Bat"
      assert page.has_content? "Home run!"
      assert page.has_css? "img[src=\"#{item_image}\"]"
      refute page.has_css? "img[src=\"#{default_image}\"]"
    end
  end
end
