require 'faker'


15.times do
   user = User.new(
   username:     Faker::Name.name,
   email:    Faker::Internet.email,
   password: Faker::Internet.password(6),
   )
 end
users = User.all

100.times do
  wiki = Wiki.create!(
  title: Faker::TheFreshPrinceOfBelAir.character,
  body: Faker::TheFreshPrinceOfBelAir.quote
  )
end
wikis = Wiki.all


admin = User.create!(
  username:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
)


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
