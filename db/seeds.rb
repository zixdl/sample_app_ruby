User.create!(name: "Song Tran Van",
             email: "songtranvan2511@gmail.com",
             password: "123321",
             password_confirmation: "123321",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

40.times do |n|
  name  = Faker::Name.name
  email = "user#{n+1}@gmail.com"
  password = "123321"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
5.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
