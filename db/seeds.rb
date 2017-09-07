# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Item.destroy_all
User.destroy_all

Category.create! [
  { name: "bangles"},
  {name: "necklace"}
]

Category.first.items.create! [
  {name: "bangle", price: 213, description:"hckhdkchds"}
]
Category.second.items.create! [
  {name: "neclace", price: 2103, description:"hckhhfs"}
]

User.create! [
  { name: "banka",email: "banka@gmail.com",user_type: "person", contact: 12345678 ,address: "bcfjdhs",  password_digest: "abs"},
  { name: "deepak",email: "deepak@gmail.com",user_type: "person", contact: 16546555 ,address: "bcfjdhs",  password_digest: "abs"},
  { name: "dipay",email: "depa@gmail.com",user_type: "admin", contact: 16555555 ,address: "dcsad",  password_digest: "dsabs"},
  { name: "deepak",email: "tibrewaldeepak00@yahoo.com",user_type: "person", contact: 12345688 ,address: "bcfjdhs",  password_digest: "abs"}
]
