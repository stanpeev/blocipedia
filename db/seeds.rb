# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


5.times do
  user = User.new(
     name:    Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
    )
  user.save!
end
users = User.all

# Create Wikis
100.times do
wiki = Wiki.create!(
  user: users.sample,
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.sentence
  )
end
wikis = Wiki.all 

#Create Member
 member = User.new(
  name: 'Stan Peev',
  email: 'stan.peev@gmail.com',
  password: 's15d27p13'
 )
 member.skip_confirmation!
 member.save!

 # Create an admin user
 admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
 admin.skip_confirmation!
 admin.save!

puts "Seed finished"
puts "#{Wiki.count} topics created"
puts "#{User.count} users created"
