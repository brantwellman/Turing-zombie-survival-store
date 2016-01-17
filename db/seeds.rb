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
    titles = ["Stylez", "Grub", "Weapons", "Gear"]
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
        password_confirmation: "password",
      },
      { first_name: "Penney",
        last_name: "Wellman",
        address: "3213 E Colfax Ave",
        city: "Denver",
        zipcode: "80206",
        email: "penney@email.com",
        password: "password",
        password_confirmation: "password"
      },
      { first_name: "Jamie",
        last_name: "Crockett",
        address: "1526 Blake St",
        city: "Denver",
        zipcode: "80202",
        email: "jamie@email.com",
        password: "password",
        password_confirmation: "password"
      },
      { first_name: "Admin",
        last_name: "Zombie Master",
        address: "1434 Blake St",
        city: "Denver",
        zipcode: "80202",
        email: "admin@email.com",
        password: "password",
        password_confirmation: "password",
        role: 1
      }
    ])
  end

  def create_items
    Item.create!([
      {
        title: "Goggles",
        price: 300,
        description: "Protect your eyeballs from all the spraying zombie blood
                      and look like a badass hipster at the same time.",
        image: "http://img00.deviantart.net/19fe/i/2011/154/e/c/steampunk_aviator_goggles_by_denbow-d3hy1cq.jpg",
        category_id: 1
      },
      {
        title: "Gas Mask",
        price: 400,
        description: "Zombies smell really bad and so do you! Protect those
                      delicate olfactories!",
        image: "http://macabregallery.com/upload/steampunk-gas-mask-for-sale-586.jpg",
        category_id: 1
      },
      {
        title: "Arm Warmers",
        price: 250,
        description: "These probably won't actually keep your arms warm, but
                      they will make it that much more inconvenient to slit your
                      wrists!",
        image: "http://ecx.images-amazon.com/images/I/61WYNjrvQ2L._UY550_.jpg",
        category_id: 1
      },
      {
        title: "Hipster Vest",
        price: 400,
        description: "You know you always wanted to be a zombie babe.",
        image: "http://www.polyvore.com/cgi/img-thing?.out=jpg&size=l&tid=118824375",
        category_id: 1
      },
      {
        title: "Tactical Vest",
        price: 600,
        description: "Pockets!!!",
        image: "http://image.sportsmansguide.com/adimgs/l/1/181819_ts.jpg",
        category_id: 1
      },
      {
        title: "Boots for Her",
        price: 300,
        description: "There's no reason not to look babely whilst chopping off
                      heads.",
        image: "https://s-media-cache-ak0.pinimg.com/236x/d9/0d/bb/d90dbba2b211815b717ab2c7de21e7fe.jpg",
        category_id: 1
      },
      {
        title: "Boots for Him",
        price: 300,
        description: "TThere's no reason not to look babely whilst chopping off
                      heads.",
        image: "https://s-media-cache-ak0.pinimg.com/736x/47/08/24/4708247d527f4ac00f141621c67125b7.jpg",
        category_id: 1
      },
      {
        title: "Pants",
        price: 700,
        description: "Blend in with the zombies!",
        image: "https://s-media-cache-ak0.pinimg.com/236x/cc/ea/5a/ccea5a64c1e78126f252bdc494d55227.jpg",
        category_id: 1
      },
      {
        title: "Camo Onesie",
        price: 200,
        description: "For men, for women, for sleeping, for fighting! It’s the
                      only outfit you’ll need!",
        image: "http://ecx.images-amazon.com/images/I/41L-xxDNGZL._SL260_SX200_CR0,0,200,260_.jpg",
        category_id: 1
      },
      {
        title: "Unicorn Meat",
        price: 10000,
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
                      a nice hand grinder before the world ends for real).",
        image: "http://pngimg.com/upload/coffee_beans_PNG9276.png",
        category_id: 2
      },
      {
        title: "Trail Mix",
        price: 7,
        description: "Nuts, seeds, other random crap. MMMMMMMM.",
        image: "http://i2.cdn.turner.com/cnn/dam/assets/120831042921-trail-mix-pile-story-top.jpg",
        category_id: 2
      },
      {
        title: "Sardines",
        price: 10,
        description: "Fishies! Packed with protein and healthy fats, these will
                      keep you fighting zombies and looking for breath mints all
                      day long.",
        image: "http://russgeorge.net/wp-content/uploads/2014/04/sardines-can.jpg",
        category_id: 2
      },
      {
        title: "Nut Butter",
        price: 15,
        description: "Smashed nuts! Spread it on all the things!",
        image: "http://cdn.shopify.com/s/files/1/0100/5392/products/PeanutButterBoyCircle600_62ada8ee-f683-4c32-92f3-a92b565b87c6_grande.jpg?v=1408043539",
        category_id: 2
      },
      {
        title: "Lard",
        price: 100,
        description: "You need your brain to fight zombies. Your brain needs fat
                      in order to work well. You can also make soap with this or
                      use it for lotion. So versatile! Spoon provided.",
        image: "https://gloomyvegan.files.wordpress.com/2008/04/lard2.jpg?w=455",
        category_id: 2
      },
      {
        title: "Nostalgic Jerky",
        price: 25,
        description: "Remember cows? They’re all gone now, in part because we
                      dried all of them we could find once we knew the world was
                      ending. You’re welcome.",
        image: "http://i.huffpost.com/gen/2681534/images/o-BEEF-JERKY-facebook.jpg",
        category_id: 2
      },
      {
        title: "Bruised Apple",
        price: 2,
        description: "If you’re lucky you’ll even get a worm! (Extra protein
                      which you need to fight zombies).",
        image: "http://www.strata-gee.com/wp-content/uploads/2013/04/BruisedApplel.jpg",
        category_id: 2
      },
      {
        title: "Bruised Apple",
        price: 2,
        description: "It's already bruised, might as well bruise it some more by
                      throwing it at some zombies. You didn't really want to eat
                      it, did you?",
        image: "http://www.strata-gee.com/wp-content/uploads/2013/04/BruisedApplel.jpg",
        category_id: 3
      },
      {
        title: "Meat Grinder",
        price: 500,
        description: "Zombie sausage anyone? Hand powered.",
        image: "https://www.homesteadersupply.com/images/10%20SS%20meat%20grinder.jpg",
        category_id: 3
      },
      {
        title: "Hand Drill",
        price: 300,
        description: "Build a shack or drill into soft decaying skulls.",
        image: "https://mickeyzsays.files.wordpress.com/2014/08/vintage-hand-drill_medium.jpg",
        category_id: 3
      },
      {
        title: "Ax",
        price: 400,
        description: "The most classic of zombie self-defense weapons. If you
                      want street cred you need a proper ax. Use it to chop your
                      way through the crowds.",
        image: "http://globe-views.com/dcim/dreams/ax/ax-06.jpg ",
        category_id: 3
      },
      {
        title: "Battle Ax",
        price: 500,
        description: "Ax style-upgrade. Get medieval on those zombies!",
        image: "http://www.heavenlyswords.com/images/T/W100.jpg",
        category_id: 3
      },
      {
        title: "Machete",
        price: 600,
        description: "Need to cut through that thick foliage as you run from the
                      zombies? Need to chop off heads? Need to cut your bruised
                      apple? This is the weapon for you!",
        image: "http://i.huffpost.com/gen/902966/images/o-MACHETE-facebook.jpg",
        category_id: 3
      },
      {
        title: "Slingshot",
        price: 250,
        description: "Collect squirrels and zombie chunks with this sweetass
                      slingshot. ",
        image: "http://www.tacticalknives.biz/ImagesProductsLarge/mkt4.jpg ",
        category_id: 3
      },
      {
        title: "Bow & Arrow",
        price: 700,
        description: "You get one arrow. Don't lose it.",
        image: "http://www.atarn.org/magyar/niya_recon.JPG",
        category_id: 3
      },
      {
        title: "Pocket Knife",
        price: 50,
        description: "Cut an apple, stab a zombie, just another day in the
                      neighborhood",
        image: "https://s3.amazonaws.com/internet-retail-connection-category-images/5_555d635ac27e92.16193687.jpg",
        category_id: 3
      },
      {
        title: "Ice Pick",
        price: 50,
        description: "For your more detailed zombie dismantling needs.",
        image: "https://tribkcpq.files.wordpress.com/2013/09/icepick.jpg",
        category_id: 3
      },
      {
        title: "Medieval Sword",
        price: 900,
        description: "JP's pet. Too bad a zombie ate him.",
        image: "https://www.medieval-weaponry.co.uk/acatalog/S5711M-920-1.jpg",
        category_id: 3
      },
      {
        title: "Katana",
        price: 1000,
        description: "Get ready to look soooo goooooood.",
        image: "http://vignette2.wikia.nocookie.net/walkingdead/images/3/3c/Katana-nagai.jpg/revision/latest?cb=20130329190843",
        category_id: 3
      },
      {
        title: "Modern Mace",
        price: 40,
        description: "Zombies don't give a crap about pepper spray, but all the
                      other creepy assholes still not zombified sure do.",
        image: "http://extras.mnginteractive.com/live/media/site106/2014/0217/20140217_093059_SE_021714_pepperspray.jpg",
        category_id: 3
      },
      {
        title: "Original Mace",
        price: 600,
        description: "Pepper spray those zombies with spikes!!",
        image: "http://i247.photobucket.com/albums/gg158/MDA2008/Mace.jpg",
        category_id: 3
      },
      {
        title: "Hammer",
        price: 40,
        description: "Smashy smashy",
        image: "https://www.dlsweb.rmit.edu.au/toolbox/electrotech/toolbox1204/resources/03workshop/05hand_tools/images/mash_hammer.jpg",
        category_id: 3
      },
      {
        title: "Straight Razor",
        price: 100,
        description: "Just because you can't shower and there's zombies
                      everywhere doesn't mean that you can't have the luxury of
                      a soft chin. It's the little things.",
        image: "http://www.cachebeauty.com/Razor/straight_razor_white464.jpg",
        category_id: 3
      },
      {
        title: "H2Oproof Matches",
        price: 300,
        description: "Have these as backup while you teach yourself to start a
                      fire without them. ",
        image: "https://wisementrading.com/wptest/wp-content/uploads/2013/09/waterproofmatches.jpg",
        category_id: 4
      },
      {
        title: "Cast Iron",
        price: 150,
        description: "Cook your food in style. Doubles as a weapon!",
        image: "http://cdn.shocho.co/sc-image/6/f/f/9/6ff9414c3bf586a2e83b2d4ddb1c3eb2.jpg",
        category_id: 4
      },
      {
        title: "Solar Headlamp",
        price: 125,
        description: "You need this, no explanation needed.",
        image: "http://media.treehugger.com/assets/images/2011/10/everlite20solar20headlamp.jpg",
        category_id: 4
      },
      {
        title: "Solar Charger",
        price: 400,
        description: "Charge your electronic gadgets! No, there won’t be cell
                      phone towers anymore, but you know you’ll want to take a
                      lot of sweet selfies with the zombie folk. Selfie stick
                      included for $30 more.",
        image: "http://media3.takealot.com/covers_tsins/30667637/High-res%20WakaWaka%20Power%20(16)-zoom.jpg?1442926885",
        category_id: 4
      },
      {
        title: "Fuel",
        price: 1000000,
        description: "You will receive some diesel fuel in a random container,
                      whatever we have. Hey, it’s actually illegal to send fuel
                      in the mail, so we have to be sneaky. And besides, beggars
                      can’t be choosers.",
        image: "http://blogsdir.cms.rrcdn.com/10/files/2013/02/diesel-fuel.jpg",
        category_id: 4
      },
      {
        title: "Water Filter",
        price: 25,
        description: "Build your own! We will send you sticks and fabric!
                      The rest is up to you.",
        image: "http://thesurvivalmom.com/wp-content/uploads/2012/03/Picture-11.png",
        category_id: 4
      },
      {
        title: "Backpack Lottery!",
        price: 99,
        description: "Just like with our tent, you get what you get. Feel free
                      to bribe us and send extra money. It might just mean you
                      get a bigger backpack. Or a prettier one.",
        image: "http://scene7.targetimg1.com/is/image/Target/11406615?wid=180&hei=180",
        category_id: 4
      },
      {
        title: "Tent",
        price: 400,
        description: "We will send you a random tent! Hey, it’s the zombie
                      apocalypse, you don’t have time to be picky. Besides, life
                      is more fun this way. It’s like a giant cracker jack box
                      for freaked out adults.",
        image: "http://wanake.typepad.com/.a/6a0120a5a1b416970b017d414b0cd7970c-pi",
        category_id: 4
      },
      {
        title: "Yurt",
        price: 50,
        description: "Build your own! Instruction come with a free box of
                      Nag Champa.",
        image: "http://ecx.images-amazon.com/images/I/51ucash1foL._SY344_BO1,204,203,200_.jpg",
        category_id: 4
      }
      ])
  end
end
Seed.start
