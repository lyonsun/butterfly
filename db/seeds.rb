# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


products = Product.create(
  [
    { name: 'Demo Product 1', description: 'This is demo product 1', price: 1180.00, stock: 99 },
    { name: 'Demo Product 2', description: 'This is demo product 2', price: 1080.00, stock: 88 },
    { name: 'Demo Product 3', description: 'This is demo product 3', price: 980.00, stock: 77 },
    { name: 'Demo Product 4', description: 'This is demo product 4', price: 880.00, stock: 66 }
  ]
)

customers = Customer.create(
  [
    { name: 'John', phone: '123456789', email: 'john@example.com' },
    { name: 'Tom', phone: '987654321', email: 'tom@example.com' }
  ]
)

addresses = Address.create(
  [
    { line1: 'Room #1', line2: 'Building #1', line3: 'Road #1', city: 'Beijing', zipcode: '123456', province: 'Beijing', country: 'China' },
    { line1: 'Room #2', line2: 'Building #2', line3: 'Road #2', city: 'Yueyang', zipcode: '414122', province: 'Yueyang', country: 'China' }
  ]
)

customers.first.update(
  {
    $push: {
      addresses: addresses.first
    }
  }
)

customers.last.update(
  {
    $push: {
      addresses: addresses.last
    }
  }
)

line_items = LineItem.create(
  [
    { product: products.find_by(name: "Demo Product 1"), quantity: 3 },
    { product: products.find_by(name: "Demo Product 2"), quantity: 3 },
  ]
)

orders = Order.create(
  [
    { date_placed: DateTime.now, date_paid: DateTime.now, total_price: 0.00, notes: 'Demostration' }
  ]
)

order.first.line_items = line_items

customer.first.push(orders: orders.first)



