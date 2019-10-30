# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtworkShare.destroy_all
Artwork.destroy_all
User.destroy_all

user1 = User.create!(username: "Walter White")
user2 = User.create!(username: "Jesse")
user3 = User.create!(username: "Hank")
user4 = User.create!(username: "Gus")

artwork1 = Artwork.create!(artist_id: user1.id, title: "Blue Meth",
image_url: "https://images.app.goo.gl/CyYCtFyzPFLDzmSf8")
artwork2 = Artwork.create!(artist_id: user2.id, title: "Portrait of Jesse",
image_url: "https://media.gq.com/photos/5d8a4896b3830800083f64d1/3:2/w_1386,h_924,c_limit/Screen%20Shot%202019-09-24%20at%2012.36.02%20PM.png")

artwork_share1 = ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user3.id)
artwork_share2 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user3.id)
artwork_share3 = ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user4.id)
