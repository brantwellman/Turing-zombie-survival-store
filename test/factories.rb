FactoryGirl.define do
  factory :item do
    title
    description
    price
    image "https://www.wpclipart.com/weapons/axe/Axe_red.svg"
  end

  factory :category do
    title

    factory :category_with_items do
      items { create_list(:item, 2) }
    end
  end

  sequence :title do |n|
    "Title#{n}"
  end

  sequence :description do |n|
    "Description #{n}"
  end

  sequence :price do |n|
    n.to_i
  end
end
