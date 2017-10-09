Blog.delete_all
User.delete_all
Comment.delete_all
Album.delete_all

user = User.create!(name: Faker::Name.name, email:'phong@gmail.com', password: '123')
user1 = User.create!(name: Faker::Name.name, email:'phong2@gmail.com', password: '123')
#(1..3).each do |number|
#    Blog.create!(title:"Topic #{number}", body:"content #{number} ahihihihihihihihihihihihihhihihi", user_id: 2, view:0)
#end

album = Album.create!(title: Faker::Lorem.sentence, avatar:'https://i.imgur.com/O0HDv11.jpg', user_id: user.id, views: '0')
album2 = Album.create!(title: Faker::Lorem.sentence, avatar:'https://i.imgur.com/fSK9cJO.jpg', user_id: user.id, views: '0')
album3 = Album.create!(title: Faker::Lorem.sentence, avatar:'https://i.imgur.com/4bztofH.png', user_id: user.id, views: '0')
album4 = Album.create!(title: Faker::Lorem.sentence, avatar:'https://i.imgur.com/DnBLcJo.jpg', user_id: user.id, views: '0')

(1..10).each do |blog_num|
    blog = user.blogs.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), view: 0)

    (1..10).each do |comment_count|
      blog.comments.create!(body: Faker::Lorem.paragraph, user_id: user.id)
    end
  end
#Blog.create!(title:'Topic2', body:'content2', user_id:2, view:0)
#Blog.create!(title:'Topic2', body:'content2', user_id:2, view:0)



  
