5.times { User.create(handle: Faker::Internet.user_name, display_name: Faker::Name.name, description: Faker::Lorem.sentence, email: Faker::Internet.email, password: "1234", gravator: "www.google.com") }
5.times { Quot.create(text: Faker::Lorem.sentence, user_id: 1) }
5.times { Quot.create(text: Faker::Lorem.sentence, user_id: 2) }

user1 = User.find(1)
user2 = User.find(2)
user3 = User.find(3)

user1.followers << user2
user1.followers << user3
