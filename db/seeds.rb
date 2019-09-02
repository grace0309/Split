# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying data...'
Post.destroy_all
Category.destroy_all
User.destroy_all

puts 'Creating Users'
users = []
grace = User.create(email: 'gracecheung@split.com' , password: 123456, first_name: 'Grace', last_name: 'Cheung', avatar: 'https://avatars1.githubusercontent.com/u/52451336?v=4')
may = User.create(email: 'mayong@split.com' , password: 123456, first_name: 'May', last_name: 'Ong', avatar: 'https://avatars3.githubusercontent.com/u/50539165?v=4')
meixuan = User.create(email: 'meixuanoh@split.com' , password: 123456, first_name: 'Meixuan', last_name: 'Oh', avatar: 'https://avatars1.githubusercontent.com/u/51052975?v=4')
[grace, may, meixuan].each do |name|
  users << name
end

20.times do
  name = Faker::Name.name
  first_name = name.split.first
  last_name = name.split.last
  email = "#{first_name}#{last_name}@split.com"
  new_user = User.create(email: email , password: 123456, first_name: first_name, last_name: last_name)
  users << new_user
end

puts 'Creating Categories'
Category.create(name: 'Fashion')
Category.create(name: 'Beauty')
Category.create(name: 'Food')
Category.create(name: 'Technology')

beauty = ['Watsons', 'Guardian', 'Sephora', 'Sasa', 'Innisfree', 'The Face Shop', 'Lush']
fashion = ['H&M', 'Uniqlo', 'Mango', 'SuperDry', 'TopShop', 'Zara', 'Bata', 'Charles & Keith']
food = ['MacDonalds', 'A&W', 'Jollibee', 'Starbucks']
technology = ['Harvey Norman', 'Challenger', 'Best Denki', 'Courts', 'Parisilk']

def generator(category, name)
  user = User.all.sample
  store_name = category.sample
  category = Category.find_by(name: name)
  start_time = Time.now - 3600*rand(1..5)
  end_time = start_time + 3600*rand(1..3)
  status = end_time > Time.now
  Post.new(user: user, store_name: store_name, category:category, start_time: start_time, end_time: end_time, status: status)
end

puts 'Beauty posts'
10.times do
  post = generator(beauty, 'Beauty')
  disc_per = rand(5..15)
  post.discount = "Get #{disc_per}% off with minimum spending of $#{disc_per*10}"
  post.quota = disc_per*10
  starting_contribution = (disc_per*10)*rand(0.1..0.5).round(2)
  post.starting_contribution = starting_contribution
  post.total_contribution = starting_contribution
  post.units  = 'dollars'
  post.save
end

puts 'Technology posts'
10.times do
  post = generator(technology, 'Technology')
  disc_per = rand(10..20)
  post.discount = "Get #{disc_per}% off with minimum spending of $#{disc_per*10}"
  post.quota = disc_per*10
  starting_contribution = (disc_per*10)*rand(0.1..0.5).round(2)
  post.starting_contribution = starting_contribution
  post.total_contribution = starting_contribution
  post.units  = 'Dollars'
  post.save
end

puts 'Fashion posts'
10.times do
  post = generator(fashion, 'Fashion')
  disc_per = rand(10..20)
  post.discount = "Enjoy #{disc_per}% off. Min #{rand(2...5)} pieces"
  post.quota = disc_per*10
  starting_contribution = (disc_per*10)*rand(0.1..0.5).round(2)
  post.starting_contribution = starting_contribution
  post.total_contribution = starting_contribution
  post.units  = 'Pieces'
  post.save
end

puts 'Food posts'
5.times do
  post = generator(food, 'Food')
  disc_per = rand(10..20)
  post.discount = "1 for 1!"
  post.quota = 2
  starting_contribution = 1
  post.starting_contribution = starting_contribution
  post.total_contribution = starting_contribution
  post.units  = 'People'
  post.save
end

puts 'Finished'





