category = Category.create!(name: 'Gems')
category.products.create!(name: 'Ruby', description: 'Best gem', price: 1000)
category.products.create!(name: 'Sapphire', description: 'Not as good as ruby', price: 500)
