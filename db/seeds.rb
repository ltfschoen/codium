User.delete_all
Post.delete_all
Recommendation.delete_all


user = User.new
user.email = 'test@test.com'
user.password = user.password_confirmation = 'password'
user.username = 'Test'
user.save

user2 = User.new
user2.email = 'test2@test.com'
user2.password = user2.password_confirmation = 'password'
user2.username = 'Test2'
user2.save


post = Post.new
post.user = user
post.title = 'test post'
post.save


post.title = 'Coding Is So Cool'
post.subtitle = 'Ball tip flank pork belly pig short ribs capicola kielbasa shoulder cow brisket turkey t-bone chuck. Pork loin kielbasa capicola leberkas bacon jowl salami biltong venison landjaeger tongue pork belly flank andouille spare ribs.'
post.save

post2 = Post.new
post2.user = user
post2.title = 'Test Post Heading'
post2.subtitle = 'Ball tip flank pork belly pig short ribs capicola kielbasa shoulder cow brisket turkey t-bone chuck. Pork loin kielbasa capicola leberkas bacon jowl salami biltong venison landjaeger tongue pork belly flank andouille spare ribs.'
post2.save

recommendation = Recommendation.new
recommendation.user = user
recommendation.post = post
recommendation.save
