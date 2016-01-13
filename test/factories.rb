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

  factory :user do
    first_name
    last_name
    address "123 Zombie Ln"
    city "Denver"
    state "CO"
    zipcode "80121"
    email
    password "password"
    password_confirmation "password"
  end

  sequence :first_name do |n|
    "First Name #{n}"
  end

  sequence :last_name do |n|
    "Last Name #{n}"
  end

  sequence :email do |n|
    "email#{n}@zombiez.com"
  end
end
