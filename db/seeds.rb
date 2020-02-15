# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Create zoos
zoos = [
    ["Denver Zoo", "Colorado", "USA"],
    ["Cheyenne Mountain Zoo", "Colorado", "USA"],
    ["Phoenix Zoo", "Arizona", "USA"],
    ["Out of Africa Wildlife Park", "Arizona", "USA"],
    ["Bearizona", "Arizona", "USA"],
    ["Wildlife Waystation", "California", "USA"],
    ["Forever Wild Wildlife Sanctuary", "California", "USA"],
    ["San Diego Zoo", "California", "USA"],
    ["Shambala Preserve", "California", "USA"],
    ["Cat Tales Zoo", "Washington", "USA"],
    ["Point Defiance Zoo", "Washington", "USA"],
    ["Triple D", "Montana", "USA"],
    ["Oregon Wildlife Sanctuary", "Oregon", "USA"],
    ["Carolina Tiger Rescue", "North Carolina", "USA"],
    ["Tiger World", "North Carolina", "USA"],
    ["Safe Haven Wildlife Sanctuary", "Nevada", "USA"],
    ["Roosevelt Park Zoo", "North Dakota", "USA"],
    ["Austin City Zoo", "Texas", "USA"],
    ["Turpentine Creek Wildlife Sanctuary", "Arkansas", "USA"],
    ["Department of Wildlife", "Rachaburi", "Thailand"],
    ["Emirates Park Zoo", "Abu Dhabi", "United Arab Emirates"]
]

zoos.each do |name, state, country|
    Zoo.create(name: name, address_attributes: {state: state, country: country})
end

# Create zookeepers 
Zoo.all.each do | zoo |
   # create random number of zookeepers for each zoo
    rand(1..5).times do
        Keeper.create(zoo_id: zoo.id)
    end
end

# Create animals


Keeper.all.each do | keeper |
    rand(1..10).times do
        # generate list of random names to choose from
        name_sources = [
            Faker::Creature::Cat.name,
            Faker::Creature::Dog.name,
            Faker::Creature::Horse.name,
            Faker::TvShows::GameOfThrones.dragon,
            Faker::TvShows::TheExpanse.ship,
            Faker::TvShows::VentureBros.character,
            Faker::TvShows::StarTrek.character,
            Faker::TvShows::RickAndMorty.character,
            Faker::TvShows::DrWho.character,
            Faker::TvShows::BojackHorseman.character,
            Faker::Movies::StarWars.character,
            Faker::Movies::LordOfTheRings.character,
            Faker::Games::Zelda.character,
            Faker::Games::Witcher.character,
            Faker::Games::Fallout.character,
            Faker::Books::Lovecraft.deity
        ]
        Animal.create(name: name_sources.sample, species: Faker::Creature::Animal.name.capitalize, keeper_id: keeper.id)
    end
end

# Create toys
toy_list = [
    {name: "Boomer Ball",
    cost: 30.00,
    description: "A nearly indestructible plastic ball. This one is a foot in diameter, great for all sorts of animals!"
    },
    {name: "Bungee Toy",
    cost: 20.00,
    description: "A durable stretchy firehose. Attach it to a fixture for a game of tug of war."
    },
    {name: "Hammock",
    cost: 80.00,
    description: "A hammock made of interwoven straps. Lounge around while eating bamboo shoots!"
    },
    {name: "Firehose Cube",
    cost: 10.00,
    description: "Recycled firehose woven into a dense, heavy cube. Good for strong animals."
    },
    {name: "Floaty Toy",
    cost: 25.00,
    description: "Buoyant toy, great for marine animals or anyone who likes to play in the pool."
    },
    {name: "Treat Dispenser",
    cost: 30.00,
    description: "This rolls around, dropping delicious treats as it goes."
    },
    {name: "Tube",
    cost: 10.00,
    description: "It's a tube. Small animals can crawl inside it. Large animals can stick their head in it. Tuuuuuuuuubbbbeeee!!!"
    },
    {name: "Puzzle Box",
    cost: 40.00,
    description: "Kind of like those toddler toys. Put the square peg into the square hole. Good for monkeys."
    },
    {name: "Rope swing",
    cost: 20.00,
    description: "Attach this to the ceiling of an enclosure. Animals can swing on it or grab it and pull it."
    },
    {name: "Hidey-hole",
    cost: 15.00,
    description: "Small box with a hole, kind of like a fort."
    },
    {name: "Crinkly Bag",
    cost: 30.00,
    description: "Durable bag that makes noises when scrunching it, great for cats."
    }
]

toy_list.each do | toy |
    Toy.create(toy)
end


# Create random number of wishes for each animal. Toy_id is random
Animal.all.each do | animal |
    rand(1..10).times do
        wish = animal.wishes.new(toy_id: rand(1..11))
        wish.save
    end
end


# Set some wishes as active (3 wishes are active at a time)
3.times do
    Wish.unfunded.sample.activate
end


# Create previously fulfilled wishes for showcase