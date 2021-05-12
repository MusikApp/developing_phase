# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all

10.times do |i|
  users = User.new(
    name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: "username#{i += 1}",
    email: "user#{i += 1}@test.com",
    password: '123123',
    description: Faker::Quote.famous_last_words
  )
  users.save
end

10.times do |i|
  posts = Post.create({ 
    user_id: i += 1,
    content: Faker::Quotes::Shakespeare.hamlet_quote 
})
end


