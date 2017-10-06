# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Blog.delete_all

(1..3).each do |number|
    Blog.create!(title:"Topic #{number}", body:"content #{number} ahihihihihihihihihihihihihhihihi", user_id: 1, view:0)
end
#Blog.create!(title:'Topic2', body:'content2', user_id:2, view:0)
#Blog.create!(title:'Topic2', body:'content2', user_id:2, view:0)
