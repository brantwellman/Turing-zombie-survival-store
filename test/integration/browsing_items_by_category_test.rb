require "test_helper"

class BrowseItemsByCategoryTest < ActionDispatch::IntegrationTest
  test "items can be viewed by category" do
    category_1, category_2 = create_list(:category_with_items, 2)

    visit "/categories/#{category_1.title}"

    assert page.has_content? category_1.items.first.title
    assert page.has_content? category_1.items.last.title

    visit "/categories/#{category_2.title}"

    assert page.has_content? category_2.items.first.title
    assert page.has_content? category_2.items.last.title
  end
end
