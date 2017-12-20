# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Post.destroy_all

puts "Creating seed posts..."

Post.create(
  title: "Post 1",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla mollis lectus sit amet hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent lobortis quam sem, at pellentesque justo commodo vitae. Suspendisse augue diam, efficitur malesuada commodo non, hendrerit ac justo. Integer a tempus nisi. Nullam sit amet massa sem. Duis mollis ipsum et erat viverra tincidunt. Pellentesque egestas arcu sed metus aliquet feugiat. Fusce elementum vehicula purus, sit amet laoreet mauris lobortis sed. Nulla magna urna, accumsan dapibus ullamcorper ac, blandit eget augue. Interdum et malesuada fames ac ante ipsum primis in faucibus."
)

Post.create(
  title: "Post 2",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla mollis lectus sit amet hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent lobortis quam sem, at pellentesque justo commodo vitae. Suspendisse augue diam, efficitur malesuada commodo non, hendrerit ac justo. Integer a tempus nisi. Nullam sit amet massa sem. Duis mollis ipsum et erat viverra tincidunt. Pellentesque egestas arcu sed metus aliquet feugiat. Fusce elementum vehicula purus, sit amet laoreet mauris lobortis sed. Nulla magna urna, accumsan dapibus ullamcorper ac, blandit eget augue. Interdum et malesuada fames ac ante ipsum primis in faucibus."
)

Post.create(
  title: "Post 3",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla mollis lectus sit amet hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent lobortis quam sem, at pellentesque justo commodo vitae. Suspendisse augue diam, efficitur malesuada commodo non, hendrerit ac justo. Integer a tempus nisi. Nullam sit amet massa sem. Duis mollis ipsum et erat viverra tincidunt. Pellentesque egestas arcu sed metus aliquet feugiat. Fusce elementum vehicula purus, sit amet laoreet mauris lobortis sed. Nulla magna urna, accumsan dapibus ullamcorper ac, blandit eget augue. Interdum et malesuada fames ac ante ipsum primis in faucibus."
)

Post.create(
  title: "Post 4",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla mollis lectus sit amet hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent lobortis quam sem, at pellentesque justo commodo vitae. Suspendisse augue diam, efficitur malesuada commodo non, hendrerit ac justo. Integer a tempus nisi. Nullam sit amet massa sem. Duis mollis ipsum et erat viverra tincidunt. Pellentesque egestas arcu sed metus aliquet feugiat. Fusce elementum vehicula purus, sit amet laoreet mauris lobortis sed. Nulla magna urna, accumsan dapibus ullamcorper ac, blandit eget augue. Interdum et malesuada fames ac ante ipsum primis in faucibus."
)

Post.create(
  title: "Post 5",
  content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc fringilla mollis lectus sit amet hendrerit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent lobortis quam sem, at pellentesque justo commodo vitae. Suspendisse augue diam, efficitur malesuada commodo non, hendrerit ac justo. Integer a tempus nisi. Nullam sit amet massa sem. Duis mollis ipsum et erat viverra tincidunt. Pellentesque egestas arcu sed metus aliquet feugiat. Fusce elementum vehicula purus, sit amet laoreet mauris lobortis sed. Nulla magna urna, accumsan dapibus ullamcorper ac, blandit eget augue. Interdum et malesuada fames ac ante ipsum primis in faucibus."
)

puts "Five seed posts created!"
