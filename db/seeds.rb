# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  categories = Category.create([
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

#     insert into users (email: 'kent@kentanderson.com',   encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Kent',   last_name: 'Anderson'])
#    p kent.id
#      bob = User.create(email: 'bob@kentanderson.com',    encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Bob',    last_name: 'Novak')
#    p bob.id
#      braden = User.create(email: 'braden@kentanderson.com', encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Braden', last_name: 'Anderson')
#    p braden.id
#      dusty = User.create(email: 'dusty@kentanderson.com',  encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Dusty',  last_name: 'Pearce')
#    p dusty.id
#      erik = User.create(email: 'erik@kentanderson.com',   encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Erik',   last_name: 'Ward')
#    p erik.id
#      matt = User.create(email: 'matt@kentanderson.com',   encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Matt',   last_name: 'Stratton')
#    p matt.id
#      pete = User.create(email: 'pete@kentanderson.com',   encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Pete',   last_name: 'Kaplan')
#    p pete.id
#      nick = User.create(email: 'nick@kentanderson.com',   encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Nick',   last_name: 'Anderson')
#    p nick.id
#      sean = User.create(email: 'sean@kentanderson.com',   encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Sean',   last_name: 'Kopec')
#    p sean.id
#      justin = User.create(email: 'justin@kentanderson.com', encrypted_password: '$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe',  created_at: '2016-01-01 12:00:00.000000', updated_at: '2016-01-01 12:00:00.000000', first_name: 'Justin', last_name: 'Cantor')
#    p justin.id
      

#      CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "username" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "first_name" varchar, "last_name" varchar)

#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('kent@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Kent','Anderson')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('bob@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Bob','Novak')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('braden@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Braden','Anderson')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('dusty@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Dusty','Pearce')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('erik@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Erik','Ward')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('matt@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Matt','Stratton')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('pete@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Pete','Kaplan')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('nick@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Nick','Anderson')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('sean@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Sean','Kopec')
#    insert into users (email, encrypted_password, created_at, updated_at, first_name, last_name)
#    values ('justin@kentanderson.com','$2a$10$A/JIT5ILzJSMvgcsfeZhTOwb1mMH4dc8VHKauSELPxnvpqj18OEQe', '2016-01-01 12:00:00.000000', '2016-01-01 12:00:00.000000', 'Justin','Cantor')

      
