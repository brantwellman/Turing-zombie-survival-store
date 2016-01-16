class Seed
  def self.start
    new.generate
  end

  def generate
    create_categories
    create_items
    create_users
  end

  def create_categories
    titles = ["Stylez", "Grub", "Weapons", "Survival Gear"]
    titles.each do |title|
      Category.create(title: title)
    end
  end

  def create_users
    User.create([
      {
        first_name: "Brant",
        last_name: "Wellman",
        address: "1510 Blake St",
        city: "Denver",
        zipcode: "80202",
        email: "brant@email.com",
        password: "password",
        password_confirmation: "password"
      }
    ])
  end

  def create_items
    Item.create!([
      {
        title: "axe1",
        price: 105,
        description: "Use it to chop your way through the crowds",
        image: "https://www.wpclipart.com/weapons/axe/Axe_red.svg",
        category_id: 1,
        status: "active"
      },
      {
        title: "axe2",
        price: 125,
        description: "It's even better! Use it to chop your way through the crowds",
        image: "https://www.wpclipart.com/weapons/axe/Axe_red.svg",
        category_id: 1,
        status: "active"
      },
      {
        title: "vest1",
        price: 135,
        description: "Not only does it look good, but you can hold lots of ammo in the pockets!",
        image: "https://www.wpclipart.com/weapons/axe/Axe_red.svg",
        category_id: 2,
        status: "active"
      },
      {
        title: "vest2",
        price: 145,
        description: "This vest has even more pockets! You can carry up to 2 days worth of food if necessary!",
        image: "https://www.wpclipart.com/weapons/axe/Axe_red.svg",
        category_id: 2,
        status: "active"
      }
      ])
  end
end
Seed.start
