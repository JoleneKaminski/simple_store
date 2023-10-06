require 'csv'

Product.destroy_all
Category.destroy_all

# 676.times do
#   Product.create(
#     title: Faker::Coffee.unique.blend_name,
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.within(range: 1..100)
#   )
# end

filename = Rails.root.join('db/products.csv')

csv_data = File.read(filename)
products = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

products.each do |p|
  category = Category.find_or_create_by(name: p['category'])

  category.products.create(
    title: p['name'],
    description: p['description'],
    price: p['price'],
    stock_quantity: p['stock quantity']
  )
end
