ActiveRecord::Base.transaction do
  categories = Category.create([{title: 'Mobile Development'}, {title: 'Photo'}, {title: 'Web Development'}])
  materials = Material.create([{name: 'paper'}, {name: 'leather'}, {name: 'carton'}])
  authors = 40.times.collect { Author.create(name: Faker::Name.name) }
  books = 25.times.collect do
            Book.create(
              title: Faker::Book.title,
              description: Faker::Lorem.paragraph(sentence_count: 25),
              category_id: categories.sample.id,
              price_cents: rand(500...10000),
              publication_year: rand(1990..2020),
              height: rand(5.0..10.0).round(1),
              width: rand(0.5..1.0).round(1),
              depth: rand(4.0..7.0).round(1)
            )
          end

  books.each_with_index do |book, index|
    book.authors << authors[index]
    book.materials << materials.sample
  end
end
