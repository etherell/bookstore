ActiveRecord::Base.transaction do
  categories = Category.create([{title: 'Mobile Development'}, {title: 'Photo'}, {title: 'Web Development'}])
  authors = 10.times.collect { Author.create(name: Faker::Name.name) }
  books = 10.times.collect do
            Book.create(
              title: Faker::Book.title,
              description: Faker::Lorem.sentence,
              category_id: categories.sample.id,
              price_cents: rand(500...10000)
            )
          end
  30.times { books.sample.authors << authors.sample }
end
