class DuffelTest < ActiveSupport::TestCase
  test "has initial contents" do
    duffel = Duffel.new({ "1" => 1 })

    assert_equal({ "1" => 1 }, duffel.contents)
  end

  test "can add an item to duffel" do
    duffel = Duffel.new({ "2" => 1 })

    duffel.add_item(1)
    duffel.add_item(2)

    assert_equal({ "1" => 1, "2" => 2 }, duffel.contents)
  end

  test "gives total number of items in duffel" do
    duffel = Duffel.new({ "1" => 1, "2" => 2, "3" => 1 })

    assert_equal 4, duffel.total
  end

  test "returns quantity for a given item" do
    duffel = Duffel.new({ "1" => 1, "2" => 2, "3" => 1 })

    assert_equal 2, duffel.count_of(2)
  end

  test "returns a collection of items" do
    item1, item2 = create_list(:item, 2)
    duffel = Duffel.new({ "#{item1.id}" => 1, "#{item2.id}" => 2 })

    items = duffel.duffel_items

    assert_equal [item1, item2], items
  end

  test "returns the sum of all items in the collection" do
    item1, item2 = create_list(:item, 2)
    duffel = Duffel.new({ "#{item1.id}" => 1, "#{item2.id}" => 2 })
    sum = item1.price + (item2.price * 2)

    assert_equal sum, duffel.subtotal
  end

  test "returns subtotal for the item" do
    item1, item2 = create_list(:item, 2)
    duffel = Duffel.new("#{item1.id}" => 1, "#{item2.id}" => 2)

    expected = item2.price * 2

    assert_equal expected, duffel.item_subtotal(item2.id)
  end
end
