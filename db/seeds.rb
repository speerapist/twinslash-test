# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Post.count.zero?
	puts 'Seeding Posts'
	User.create!(email: 'user_first@mail.ru', password: 'abcabc', first_name: 'Alex', last_name: 'Skeete')
	Post.create!(title: "Firs Post", content: "This is First post!!")
	Post.create!(title: "Second Post", content: "This is Second post!!")
	Post.create!(title: "Third Post", content: "This is Third post!!")
end