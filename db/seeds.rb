# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


consoles = ["Gameboy", "Gameboy Color", "Gameboy Advance", "Gamecube", "iOS",
            "Nintendo64", "NintendoDS", "Nintendo3DS", "PC", "PlayStation",
            "PS-2", "PS-3", "PS-4", "PS-P", "VITA", "XBox", "XBox360", "XBoxOne", "Wii", "Wii U"]

consoles.each do |console|
  Console.create(name: console)
end
