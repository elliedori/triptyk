User.create(first_name: "Ellie")
User.create(first_name: "Ana")
User.create(first_name: "Maia")

Destination.create(name: "Zion")
Destination.create(name: "Arches")
Destination.create(name: "Hawaii")
Destination.create(name: "San Diego")

Trip.create(user_id: 1, destination_id: 1)
Trip.create(user_id: 1, destination_id: 3)
Trip.create(user_id: 2, destination_id: 1)
Trip.create(user_id: 2, destination_id: 2)
Trip.create(user_id: 3, destination_id: 2)
Trip.create(user_id: 1, destination_id: 4)
Trip.create(user_id: 2, destination_id: 4)
Trip.create(user_id: 3, destination_id: 4)

