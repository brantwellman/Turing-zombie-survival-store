# class Seed
#   def self.start
#     new.generate
#   end
#
#   def generate
#     create_items
#     create_categories
#   end
#
#   def create_categories
#     titles = ["Stylez", "Grub", "Weapons", "Survival Gear"]
#     titles.each do |title|
#       Category.create(title: title)
#     puts "#{Category.all.map(&:title).join(", ")} created."
#     end
#   end
#
#   def create_items
#     items.each do |title, price, description, image, category_id|
#       Item.create(title: title, price: price, description: description, image: image, category_id: category_id)
#     end
#   end
#
#   private
#
#   def items
#     [
#       {
#       title: "axe1",
#       price: 10.5,
#       description: "Use it to chop your way through the crowds",
#       image: "https://www.wpclipart.com/weapons/axe/Axe_red.svg",
#       category_id: 1
#       }
#       {
#       title: "axe2",
#       price: 12.5,
#       description: "It's even better! Use it to chop your way through the crowds",
#       image: "https://www.wpclipart.com/weapons/axe/Axe_red.svg",
#       category_id: 1
#       },
#       {
#       title: "vest1",
#       price: 13.5,
#       description: "Not only does it look good, but you can hold lots of ammo in the pockets!",
#       image: "https://www.wpclipart.com/weapons/axe/Axe_red.svg",
#       category_id: 2},
#       {
#       title: "vest2",
#       price: 14.5,
#       description: "This vest has even more pockets! You can carry up to 2 days worth of food if necessary!",
#       image: "https://www.wpclipart.com/weapons/axe/Axe_red.svg",
#       category_id: 2
#       }
#     ]
#   end
# end
# Seed.start
