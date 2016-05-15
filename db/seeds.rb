# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  categories = Category.create([
      { category_name: 'Shelter', item_order: 2 }, 
      { category_name: 'Sleeping', item_order: 3 },
      { category_name: 'Clothing', item_order: 4 }, 
      { category_name: 'Cooking', item_order: 5 }, 
      { category_name: 'Trail & Camp', item_order: 7 }, 
      { category_name: 'Toiletries & Medical', item_order: 8 }, 
      { category_name: 'Sport', item_order: 9 }, 
      { category_name: 'Amenities & Luxury', item_order: 11 }, 
      { category_name: 'Food', item_order: 10 }, 
      { category_name: 'Water Purification & Storage', item_order: 6 }, 
      { category_name: 'Pack(s)', item_order: 1 }, 
   	{ category_name: 'Emergency', item_order: 12 }
   	])

# Development encrypted password = $2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe
# Production encrypted password = $2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku

#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('kent@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Kent','Anderson')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('bob@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Bob','Novak')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('braden@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Braden','Anderson')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('dusty@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Dusty','Pearce')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('erik@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Erik','Ward')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('matt@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Matt','Stratton')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('pete@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Pete','Kaplan')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('nick@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Nick','Anderson')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('sean@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Sean','Kopec')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('justin@kentanderson.com','$2a$10$SYE7lEvJcXTQMQhL03A9ReX03RuUdwVI.895gZTRPMYR5SEifolku', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Justin','Cantor')

      