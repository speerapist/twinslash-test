if Post.count.zero?
  puts 'Seeding Posts'
  14.times do
    Post.create!(
      post_type_id: 1,
      user_id: 2,
      status: 'published',
      title: Faker::Games::Dota.player,
      content: Faker::Hipster.paragraphs(number: 2)
    )
  end

  14.times do
    Post.create!(
      post_type_id: 2,
      user_id: 1,
      status: 'published',
      title: Faker::Games::Dota.player,
      content: Faker::Hipster.paragraphs(number: 2)
    )
  end

  6.times do
    Post.create!(
      post_type_id: 1,
      user_id: 2,
      status: 'draft',
      title: Faker::Games::Dota.hero,
      content: Faker::Hipster.paragraphs(number: 2)
    )
  end

  6.times do
    Post.create!(
      post_type_id: 2,
      user_id: 1,
      status: 'draft',
      title: Faker::Games::Dota.hero,
      content: Faker::Hipster.paragraphs(number: 2)
    )
  end

  6.times do
    Post.create!(
      post_type_id: 1,
      user_id: 2,
      status: 'new_post',
      title: Faker::ProgrammingLanguage.name,
      content: Faker::Hipster.paragraphs(number: 2)
    )
  end

  6.times do
    Post.create!(
      post_type_id: 2,
      user_id: 1,
      status: 'new_post',
      title: Faker::ProgrammingLanguage.name,
      content: Faker::Hipster.paragraphs(number: 2)
    )
  end

  5.times do
    Post.create!(
      post_type_id: 2,
      user_id: 2,
      status: 'archived',
      title: Faker::Games::Dota.player,
      content: Faker::Hipster.paragraphs(number: 2)
    )
  end

  5.times do
    Post.create!(
      post_type_id: 2,
      user_id: 1,
      status: 'archived',
      title: Faker::Games::Dota.player,
      content: Faker::Hipster.paragraphs(number: 2)
    )
  end

  5.times do
    Post.create!(
      post_type_id: 2,
      user_id: 2,
      status: 'rejected',
      title: Faker::Games::Dota.hero,
      content: Faker::Books::Lovecraft.paragraphs(number: 2)
    )
  end

  5.times do
    Post.create!(
      post_type_id: 2,
      user_id: 1,
      status: 'rejected',
      title: Faker::Games::Dota.hero,
      content: Faker::Books::Lovecraft.paragraphs(number: 2)
    )
  end
end

if User.count.zero?
  puts 'Seeding Users'
  User.create!(email: 'user_first@mail.ru', password: 'qwerty', first_name: 'Alex', last_name: 'Skeete')
  User.create!(email: 'user_second@mail.ru', password: 'qwerty', first_name: 'Benedict', last_name: 'Oh')
  puts 'Seeding Admin'
  User.create!(email: 'admin@mail.ru', password: 'qwerty', first_name: 'Admin', last_name: 'Admin', admin: true)
  puts 'Seeding Types'
  PostType.create!(name: 'first_type')
  PostType.create!(name: 'last_type')
end
