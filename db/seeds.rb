class Seed
  def self.start
    new.generate
  end

  def generate
    create_categories
    create_items
  end

  def create_categories
    titles = ["Stylez", "Grub", "Weapons", "Gear"]
    titles.each do |title|
      Category.create(title: title)
    end
  end

  def create_items
    Item.create!([
      {
        title: "Unicorn Meat",
        price: 10,000,
        description: "The only can in existence from the only known unicorn in
                      history! Get it before the world ends for real!",
        image: "https://s-media-cache-ak0.pinimg.com/236x/07/e7/3f/07e73fb9f036ead371de1b5a685c8fdf.jpg",
        category_id: 2
      },
      {
        title: "Kale",
        price: 5,
        description: "Kale! Proven to make you healthier, more beautiful, and
                      more prepared to fight zombies!",
        image: "http://images1.westword.com/imager/u/original/6832210/kale.jpg",
        category_id: 2
      },
      {
        title: "Coffee",
        price: 20,
        description: "If you’re like us, the lack of coffee will be tragic
                       enough to make you want to kill yourself before the
                       zombies even arrive. So stock up! You should probably
                       head over to the weapons page and get a hammer too - when
                       not bashing skulls you can bash your coffee beans (or buy
                       a nice hand grinder before the world ends for real)",
        image: "http://pngimg.com/upload/coffee_beans_PNG9276.png",
        category_id: 2
      },
      {
        title: "Trail Mix",
        price: 7,
        description: "",
        image: "http://i2.cdn.turner.com/cnn/dam/assets/120831042921-trail-mix-pile-story-top.jpg",
        category_id: 2
      }
      ])
  end
end
Seed.start
