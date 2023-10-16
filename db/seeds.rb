User.create!(
  email: 'user1@example.com',
  password: '111111',
  password_confirmation: '111111',
  name: 'John Doe',
  age: 30,
  gender: 'Male'
)

User.create!(
  email: 'user2@example.com',
  password: 'password456',
  password_confirmation: 'password456',
  name: 'Jane Smith',
  age: 25,
  gender: 'Female'
)

Route.create!(
  distance: 700,
  route_name: "Indore-Jaipur"
)
Route.create!(
  distance: 400,
  route_name: "Indore-Jabalpur"
)
Route.create!(
  distance: 300,
  route_name: "Indore-Harda"
)
routes = Route.order(:id)
routes.first.buses.create!(
  bus_type:"normal", capacity: 22, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 600, available: true, bus_destination: "Jaipur", bus_arrival: "Indore", bus_name: "Intercity"
)
routes.first.buses.create!(
  bus_type:"sleeper",capacity: 20, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 1000, available: true, bus_destination: "Jaipur", bus_arrival: "Indore", bus_name: "Intercity 2"
)
routes.first.buses.create!(
  bus_type:"ac_sleeper",capacity: 18, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 1600, available: true, bus_destination: "Jaipur", bus_arrival: "Indore", bus_name: "Intercity 3"
)
#second route bus
routes.second.buses.create!(
  bus_type:"normal", capacity: 22, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 600, available: true, bus_destination: "Jabalpur", bus_arrival: "Indore", bus_name: "Basic"
)
routes.second.buses.create!(
  bus_type:"sleeper",capacity: 20, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 1000, available: true, bus_destination: "Jabalpur", bus_arrival: "Indore", bus_name: "Basic 2"
)
routes.second.buses.create!(
  bus_type:"ac_sleeper",capacity: 18, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 1600, available: true, bus_destination: "Jabalpur", bus_arrival: "Indore", bus_name: "Basic 3"
)

#Third route bus
routes.last.buses.create!(
  bus_type:"normal", capacity: 22, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 600, available: true, bus_destination: "Harda", bus_arrival: "Indore", bus_name: "SuperFast"
)
routes.last.buses.create!(
  bus_type:"sleeper",capacity: 20, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 1000, available: true, bus_destination: "Harda", bus_arrival: "Indore", bus_name: "SuperFast 2"
)
routes.last.buses.create!(
  bus_type:"ac_sleeper",capacity: 18, departure_date: Date.today, arrival_date: Date.today, rating: 4, seat_price: 1600, available: true, bus_destination: "Harda", bus_arrival: "Indore", bus_name: "SupewrFast 3"
)
# creating seats
@bus = Bus.find(1)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end

@bus = Bus.find(2)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end 

@bus = Bus.find(3)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end 

@bus = Bus.find(4)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end 

@bus = Bus.find(5)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end 

@bus = Bus.find(6)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end 

@bus = Bus.find(7)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end 

@bus = Bus.find(8)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end  

@bus = Bus.find(9)
1..@bus.capacity.times do |seat|
  @bus.seats.create!(seat_no: (seat+1), seat_price: @bus.seat_price)
end 