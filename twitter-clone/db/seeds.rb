# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create!(username:  "mfcrespo",
             name: "Maria Crespo",
             email: "mfcrespo@example.com",
             password:              "123456",
             password_confirmation: "123456")

18.times do |n|
  username = Faker::Twitter.unique.screen_name
  name  = Faker::Name.unique.name
  email = Faker::Internet.email(domain: 'example')
  password = "123456"
  User.create!(username: username,
              name: name,
              email: email,
              password:              password,
              password_confirmation: password)
end

# Tweets
users = User.order(:created_at).take(6)
7.times do
  tweet = Faker::Quote.unique.famous_last_words
  users.each { |user| user.tweets.create!(tweet: tweet) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
