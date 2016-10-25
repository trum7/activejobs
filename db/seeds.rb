# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#stocks = StockStatus.create([{name: 1},{name: 0}])




category = Category.create([{name: "Black, Grey, and White"},{name:"Drawstring Mochilas"},{name:"Earth/Brown"},{name:"Jeweled Mochilas"},{name:"Mini Mochilas"},{name:"Mini Single Thread Mochilas"},{name:"Neon Colors"},{name:"Neon Pink"},{name:"Pom Pom Mochilas"},{name:"Single Thread Mochilas"},{name:"Solid Colors"},{name:"Traditional Colors"},{name:"Traditional Pink"}])
#category2 = Category.create([{name: "Black with Colors"},{name:"Matisse Style"},{name:"Mini Double Thread Mochila"},{name:"Mini Single Thread Mochila"},{name:"Mini XL Single Thread Mochila"},{name:"Neon"},{name:"Premium"},{name:"Single Thread Large Mochila"},{name:"Solid Black"},{name:"Solid White"},{name:"Wayuu Accesory Bags"},{name:"Wayuu Clutch"}])
status = OrderStatus.create([{name: "Completed"},{name: "Processing"},{name: "Canceled"},{name: "Pending"}])
country = Country.create([{name: "United States"},{name: "Colombia"},{name: "Canada"},{name: "Australia"}])
category = Category.create([{name: "Black, Grey, and White"},{name:"Drawstring Mochilas"},{name:"Earth/Brown"},{name:"Jeweled Mochilas"},{name:"Mini Mochilas"},{name:"Mini Single Thread Mochilas"},{name:"Neon Colors"},{name:"Neon Pink"},{name:"Pom Pom Mochilas"},{name:"Single Thread Mochilas"},{name:"Solid Colors"}])
category2 = Category.create([{name: "Black with Colors"},{name:"Matisse Style"},{name:"Mini Double Thread Mochila"},{name:"Mini Single Thread Mochila"},{name:"Mini XL Single Thread Mochila"},{name:"Neon"},{name:"Premium"},{name:"Single Thread Large Mochila"},{name:"Solid Black"},{name:"Solid White"},{name:"Wayuu Accesory Bags"}])
category3 = Category.create([{name:"Traditional Colors"},{name:"Traditional Pink"},{name:"Wayuu Clutch"}])
