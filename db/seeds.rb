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
    rand(5).times do
        Keeper.create(zoo_id: zoo.id)
    end
end

# Create animals



# Create toys



# Create wishes and associate them to animals



# Set some wishes as active



# Create previously fulfilled wishes for showcase