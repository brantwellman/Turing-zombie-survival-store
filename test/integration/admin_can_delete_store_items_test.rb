class AdminCanDeleteItemsTest < ActionDispatch::IntegrationTest
  test "the item is no longer on the index page" do
    admin = create_admin
    login(admin)
    item = create(:item)

    visit items_path
    assert page.has_content? item.title

    visit item_path(item)
    click_on "Delete Item"

    assert_equal items_path, current_path
    refute page.has_content? item.title
  end
end
