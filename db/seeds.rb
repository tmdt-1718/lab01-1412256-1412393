Blog.delete_all
User.delete_all
user = User.create!(name: Faker::Name.name, email:'phong@gmail.com', password: '123')
user = User.create!(name: Faker::Name.name, email:'phong2@gmail.com', password: '123')
(1..3).each do |number|
    Blog.create!(title:"Topic #{number}", body:"content #{number} ahihihihihihihihihihihihihhihihi", user_id: 2, view:0)
end
#Blog.create!(title:'Topic2', body:'content2', user_id:2, view:0)
#Blog.create!(title:'Topic2', body:'content2', user_id:2, view:0)



  
