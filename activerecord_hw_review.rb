
# five most expensive items
Item.order (price: :desc).limit(5)
puts "Item | Price"
items.each do |item|
  puts "#{item.title} | #{item.price}"
end
#.pluck returns an array to a field or fields of the array you select

# most expensive book
Item.where(category: "Books").order(price: :asc).first


# puts 'Who lives at 6439 Zetta Hills, Willmouth, WY? Do they have another address?'
person = Address.find_by(street: "6439 Zetta Hills", city: "Willmouth", state: "WY").user
puts "#{person.full_name} lives there" # this only works when you write the 'full_name' method



# puts 'Correct Virginie Mitchells address to New York, NY, 10108.'

virginie = User.find_by(first_name: "Virginie", last_name: "Mitchell")
virginie.addresses.update_all(city: "New York", state: "NY", zip: "10108")
#update_all will do everything in one shot and will not validate
# #update will loop through and do each address one at a time and will also validate the data if you want it to
puts 'Virginies addresses are now:'
virigine.addreses.each do |addy|
  puts add.full_address
end
# create a full address method that interpolates the fields


# puts 'How much would it cost to buy one of each tool?'
total = Item.where(category: "Tools").sum(:price)


# puts 'How many total items did we sell?'
#this one is where you needs to hook up your orders class
total_orders = Orders.sum(:quantity)


# puts 'How much was spent on books?'
revenue = Order.joins(:item).where(category: "Books").sum("price * quantity")
#this will not work because it creates your where clause based on the ORDER class, so it is looking for order.category, which does not exist.
#category is on the item table. so even though you joined them, it's not building the where statement on the items table.
revenue = Order.joins(:item).where("items.category LIKE '%Books%'").sum("price * quantity")
#this what you are making your where statement more specific so that it will look on the right table
revenue = Order.joins(:item).where("items.category LIKE '%?%'", "Book").sum("price * quantity")

# puts 'Simulate buying an item by inserting a User for yourself and an Order for that User.'
me = User.create(first_name: "Chris", last_name: "Vannoy", email: "chirs@bt.com")
item = Item.find(42)
order = Order.create(user_id: me.id, item_id: itme.id, quantity: 23)

me.orders << Order.new(item: item, quantity: 23) # this is the same thing as line 53.  a user can have many orders as defined by the class, so you can
# return an array of orders.  which means you may also push to the array.  which is what line 55 does.  Also, Active Record is smart enough to understand that
# 'item' will map up with the foreign key, so you do not need to specify 'item_id'


#itmems ordered most often? grossed most money?
often = Order.group(:item).sum(:quantity).max_by{|key, value| value}
#item is returning the entire object that is probably grouping by item id, if you specify group(:item_id) this will return just the item id.

puts often.inspect #inspect puts the full ruby representation of the object

most = Order.group(:item).joins(:item).sum("price * quantity").max_by{|key, value| value}
# you have to call joins on this one because you need to get 'price' from the items table.  if you need two tables in the SQL query, then you'll need to
# join the tables.

#user spent the most?
spender = User.joins(order: :item).select("users.*, SUM(price * quantity) AS total").order("total desc").group(:id).first


#top 3 highest grossing categories

categories = Itme.joins(:orders).group(:category).order("sum_price_all_quantity DESC").limit(3).sum("price * quantity")
# remember to keep sum at the end

categories.each do |categories, revenue|
  puts "#{category} made us #{revenue}"
end
