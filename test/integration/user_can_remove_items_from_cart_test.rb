require 'test_helper'

class UserCanEditItemQuantityInCart < ActionDispatch::IntegrationTest

  test "user removes item from cart by subtracting until quantity is 0" do
    item = create(:item)

    visit items_path
    click_link "Add to Duffel"
    visit duffel_path

    within '.cart-item-info' do
      assert page.has_content? "#{item.title}"
    end
    within '#cart-item-quantity' do
      assert page.has_content? "1"
    end

    click_link_or_button "remove_circle_outline"

    refute page.has_content? "#{item.title}"
    refute page.has_content? "1"
  end

  test "user removes item from cart by clicking remove button" do
    item = create(:item)

    visit items_path
    click_link "Add to Duffel"
    visit duffel_path

    within '.cart-item-info' do
      assert page.has_content? "#{item.title}"
    end
    within '#cart-item-quantity' do
      assert page.has_content? "1"
    end

    click_link_or_button "remove"

    refute page.has_content? "#{item.title}"
    refute page.has_content? "1"
  end

end
