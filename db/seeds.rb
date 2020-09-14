# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Post.count.zero?
	puts 'Seeding Posts'
	Post.create!(title: "Firs Post", content: "This is First post!!", user_id: 1)
	Post.create!(title: "Second Post", content: "This is Second post!!", user_id: 2)
	Post.create!(title: "Third Post", content: "This is Third post!!", user_id: 1)
	Post.create!(title: "4th Post", content: "This is 4th post!!", user_id: 2)
	Post.create!(title: "5th Post", content: "This is 5th post!!", user_id: 2)
	Post.create!(title: "6th Post", content: "This is 6th post!!", user_id: 1)
end

if User.count.zero?
	puts 'Seeding Users'
	User.create!(email: 'user_first@mail.ru', password: 'abcabc', first_name: 'Alex', last_name: 'Skeete')
	User.create!(email: 'user_second@mail.ru', password: 'abcabc', first_name: 'Benedict', last_name: 'Oh')
end

if User.count == 2
	puts 'Seeding Admin'
	User.create!(email: 'admin@mail.ru', password: 'abcabc', first_name: 'admin', last_name: 'admin', admin: true)
end
