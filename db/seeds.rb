10.times do
  User.create(username: Faker::Name.name, email: Faker::Internet.email, password: "password")
end

User.create(username: "sono123", email: "steveono@gmail.com", password: "password")

20.times do
  Article.create(title: Faker::Lorem.sentence(2), image_url: "http://img2.netcarshow.com/Porsche-911_GT3_2014_1024x768_wallpaper_01.jpg", content: Faker::Lorem.paragraph(15), user_id: rand(1..10))
end

120.times do
	Comment.create(comment: Faker::Lorem.sentence(2), user_id: rand(1..10), article_id: rand(1..20))
end

tags = []
10.times { tags << Tag.create(name: Faker::Lorem.word) }

20.times do
	ArticleTag.create(article_id: rand(1..20), tag_id: rand(1..10))
end







