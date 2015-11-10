# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
   categories = Category.create([
      { category_name: '' }, 
   	{ category_name: 'Shelter' }, 
   	{ category_name: 'Sleeping' },
      { category_name: 'Clothing' }, 
   	{ category_name: 'Cooking' }, 
   	{ category_name: 'Hiking' }, 
      { category_name: 'Medical' }, 
   	{ category_name: 'Sport' }, 
   	{ category_name: 'Amenities' }, 
   	{ category_name: 'Food' }, 
   	{ category_name: 'Miscellaneous' }
   	])