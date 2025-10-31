# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#
user1 = User.create(name: '大阪 大', email: 'oosaka@email.com', password: 'password')
user2 = User.create(name: '東京 都', email: 'tokyo@email.com', password: 'password')
user3 = User.create(name: '北海 道', email: 'hokkaido@email.com', password: 'password')

post1 = Post.create(title: '投稿1', content: '最初の投稿', user_id: 1)
post2 = Post.create(title: '投稿2', content: '2つ目の投稿', user_id: 2)
post3 = Post.create(title: '投稿3', content: '3つ目の投稿', user_id: 1)
