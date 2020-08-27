# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

adminのsing_inデータ
Admin.create!(
	email: 'test@test.com',
	password: 'testtest',
)

# 4.times do |n|
# Item.create!(
# 	name:"チョコレートソース#{n+1}",
# 	explanation:"美味しい美味しいチョコレート",
# 	genre_id:1,
# 	price:350,
# 	)
# end

Category.find_or_create_by(name:"クレーム")
Category.find_or_create_by(name:"提案")
Category.find_or_create_by(name:"改善案")
Category.find_or_create_by(name:"お客様の声")