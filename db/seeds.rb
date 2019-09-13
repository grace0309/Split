# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings'} ])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

puts 'Destroying data...'
Message.destroy_all
Favourite.destroy_all
Post.destroy_all
Category.destroy_all
User.destroy_all
Deal.destroy_all

puts 'Creating Categories'
Category.create(name: 'Fashion')
Category.create(name: 'Beauty')
Category.create(name: 'Food')
Category.create(name: 'Technology')

puts 'Creating Users'
may = User.create(email: 'mayong@split.com' , password: 123456, first_name: 'May', last_name: 'Ong', avatar: 'https://avatars3.githubusercontent.com/u/50539165?v=4')
grace = User.create(email: 'gracecheung@split.com' , password: 123456, first_name: 'Grace', last_name: 'Cheung', avatar: 'https://avatars1.githubusercontent.com/u/52451336?v=4')
meixuan = User.create(email: 'meixuanoh@split.com' , password: 123456, first_name: 'Meixuan', last_name: 'Oh', avatar: 'https://avatars1.githubusercontent.com/u/51052975?v=4')

7.times do
  name = Faker::TvShows::ParksAndRec.character
  first_name = name.split.first
  last_name = name.split.last
  email = "#{first_name}#{last_name}@split.com"
  new_user = User.create(email: email , password: 123456, first_name: first_name, last_name: last_name)
  # users << new_user
end

def select_user
  users = User.all
  user = users.sample
end

def without_user(user)
  new_users = User.all - [user]
end

def generate_posts(user, category_name, start_time, end_time)
  address = ['Orchard Ion', 'Bishan Junction 8', 'Orchard Takashimaya', 'Jurong Westgate', 'Paya Lebar Square', 'VivoCity Singapore', 'Wheelock Place Orchard', 'Funan Singapore', 'Jewel Changi Singapore', 'Tangs Orchard', 'Orchard Central']
  if category_name == 'Beauty'
    beauty = ['Watsons', 'Guardian', 'Sephora', 'Sasa', 'Innisfree', 'The Face Shop', 'Lush', 'Aesop', 'The Body Shop', 'Lancome']
    disc_per = rand(10..30)
    quota = disc_per*5
    discount = "Get #{disc_per}% off with minimum spending of $#{quota}"
    starting_contribution = quota*rand(0.3..0.6).round(2)
    store_name = beauty.sample
    units  = 'Dollars'
  elsif category_name == 'Technology'
    technology = ['Harvey Norman', 'Challenger', 'Best Denki', 'Courts', 'Parisilk', 'Gain City']
    disc_per = rand(10..20)
    quota = disc_per*10
    discount = "#{disc_per}% off! Minimum spend $#{quota}"
    starting_contribution = quota*rand(0.3..0.6).round(2)
    store_name = technology.sample
    units  = 'Dollars'
  elsif category_name == 'Fashion'
    fashion = ['Uniqlo', 'Mango', 'SuperDry', 'Zara', 'Bata', 'Topshop', 'Superga', 'Bershka', 'Cotton On']
    disc_per = rand(10..20)
    quota = rand(3..5)
    discount = "Enjoy #{disc_per}% off storewide. Min #{quota} pieces"
    starting_contribution = rand(2..3)
    store_name = fashion.sample
    units  = 'Pieces'
  elsif category_name == 'Food'
    food = ['McDonalds', 'Jollibee', 'Starbucks', 'Burger King', '4 Fingers', 'PastaMania', 'Ramen San', 'Toast Box', 'Boost', 'Salad Stop']
    friends = rand(1..3)
    discount_arr = ["#{friends} for 1! A deal is made better with friends", "Bring #{friends} friends & we will give you a surprise"]
    discount = discount_arr.sample
    quota = friends + 1
    starting_contribution = 1
    total_contribution = starting_contribution
    store_name = food.sample
    units  = 'People'
  end
  chosen_address = address.sample
  category = Category.find_by(name: category_name)
  total_contribution = starting_contribution
  start_time = Time.now
  end_time = start_time + 43200*rand(0.70...1)
  status = end_time > Time.now
  Post.create(user: user, discount: discount, store_name: store_name, category:category, quota: quota, units: units, starting_contribution: starting_contribution, total_contribution: total_contribution, start_time: start_time, end_time: end_time, address: chosen_address)
end

puts 'Beauty posts'
20.times do
  users = User.all
  user = users.sample
  not_user = users - [user]
  post = generate_posts(user, 'Beauty', 15, 30)
  # Creating dummy messages for now
  # selected_not_user = not_user.sample
  # Transaction.create(contribution: rand(20..50),post: post, user: selected_not_user)
  # Message.create(user: selected_not_user, post: post, message_content: Faker::TvShows::StrangerThings.quote)
end

puts 'Technology posts'
20.times do
  users = User.all
  user = users.sample
  not_user = users - [user]
  post = generate_posts(user, 'Technology', 15, 30)
  # Creating dummy messages for now
  # selected_not_user = not_user.sample
  # Transaction.create(contribution: rand(50..100),post: post, user: selected_not_user)
  # Message.create(user: selected_not_user, post: post, message_content: Faker::TvShows::StrangerThings.quote)
end

puts 'Fashion posts'
20.times do
  users = User.all
  user = users.sample
  not_user = users - [user]
  post = generate_posts(user, 'Fashion', 15, 30)
  # Creating dummy messages for now
  # selected_not_user = not_user.sample
  # Transaction.create(contribution: rand(2..3),post: post, user: selected_not_user)
  # Message.create(user: selected_not_user, post: post, message_content: Faker::TvShows::StrangerThings.quote)
end

puts 'Food posts'
10.times do
  users = User.all
  user = users.sample
  not_user = users - [user]
  post = generate_posts(user, 'Food', 15, 30)
  # Creating dummy messages for now
  # selected_not_user = not_user.sample
  # Transaction.create(contribution: rand(0..1),post: post, user: selected_not_user)
  # Message.create(user: selected_not_user, post: post, message_content: Faker::TvShows::StrangerThings.quote)
end

puts 'Creating Deals'
url = "https://t.me/s/goodlobang"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

regex = /[\u{203C}\u{2049}\u{20E3}\u{2122}\u{2139}\u{2194}-\u{2199}\u{21A9}-\u{21AA}\u{231A}-\u{231B}\u{23E9}-\u{23EC}\u{23F0}\u{23F3}\u{24C2}\u{25AA}-\u{25AB}\u{25B6}\u{25C0}\u{25FB}-\u{25FE}\u{2600}-\u{2601}\u{260E}\u{2611}\u{2614}-\u{2615}\u{261D}\u{263A}\u{2648}-\u{2653}\u{2660}\u{2663}\u{2665}-\u{2666}\u{2668}\u{267B}\u{267F}\u{2693}\u{26A0}-\u{26A1}\u{26AA}-\u{26AB}\u{26BD}-\u{26BE}\u{26C4}-\u{26C5}\u{26CE}\u{26D4}\u{26EA}\u{26F2}-\u{26F3}\u{26F5}\u{26FA}\u{26FD}\u{2702}\u{2705}\u{2708}-\u{270C}\u{270F}\u{2712}\u{2714}\u{2716}\u{2728}\u{2733}-\u{2734}\u{2744}\u{2747}\u{274C}\u{274E}\u{2753}-\u{2755}\u{2757}\u{2764}\u{2795}-\u{2797}\u{27A1}\u{27B0}\u{2934}-\u{2935}\u{2B05}-\u{2B07}\u{2B1B}-\u{2B1C}\u{2B50}\u{2B55}\u{3030}\u{303D}\u{3297}\u{3299}\u{1F004}\u{1F0CF}\u{1F170}-\u{1F171}\u{1F17E}-\u{1F17F}\u{1F18E}\u{1F191}-\u{1F19A}\u{1F1E7}-\u{1F1EC}\u{1F1EE}-\u{1F1F0}\u{1F1F3}\u{1F1F5}\u{1F1F7}-\u{1F1FA}\u{1F201}-\u{1F202}\u{1F21A}\u{1F22F}\u{1F232}-\u{1F23A}\u{1F250}-\u{1F251}\u{1F300}-\u{1F320}\u{1F330}-\u{1F335}\u{1F337}-\u{1F37C}\u{1F380}-\u{1F393}\u{1F3A0}-\u{1F3C4}\u{1F3C6}-\u{1F3CA}\u{1F3E0}-\u{1F3F0}\u{1F400}-\u{1F43E}\u{1F440}\u{1F442}-\u{1F4F7}\u{1F4F9}-\u{1F4FC}\u{1F500}-\u{1F507}\u{1F509}-\u{1F53D}\u{1F550}-\u{1F567}\u{1F5FB}-\u{1F640}\u{1F645}-\u{1F64F}\u{1F680}-\u{1F68A}]/

html_doc.search('.tgme_widget_message_bubble').each do |post|
  image_element = post.search('.tgme_widget_message_photo_wrap')
  image = image_element.map{ |n| n['style'][/url\((.+)\)/, 1] }
  if image[0]
  image_re = image[0].gsub(/'/,"")
  text_element = post.search('.tgme_widget_message_text')
  content = text_element.text.strip.gsub(/(Telegram: @goodlobang)/, '').gsub(/More info: @goodlobangpolice/, '').gsub(/Join now: @goodlobangpolice/,'')
  element = content.split(regex)
  filtered_content = element.reject {|item| item == "" || item == " " || item ==  "️"}
  filtered_content.delete_at(0)
  filtered_content_join = filtered_content.join("\n")
  deal = Deal.new(title: filtered_content[0], image_url: image_re, description: filtered_content_join )
  deal.save
  end
end

puts 'Finished'

