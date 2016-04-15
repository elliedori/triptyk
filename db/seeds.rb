

5.times do
  User.create first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  username: Faker::Internet.user_name,
  password: "12345678"
end




10.times do
  arr = [1,2,3,4,5]
  Relationship.create follower_id: arr.shuffle.pop,
  followee_id: arr.shuffle.pop
end
