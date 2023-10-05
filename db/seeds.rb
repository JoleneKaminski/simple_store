676.times do
  Product.create(
    title: Faker::Coffee.unique.blend_name,
    price: Faker::Commerce.price,
    stock_quantity: Faker::Number.within(range: 1..100)
  )
end
