require 'Faker'

Article.destroy_all

categories = %w(tech career challenge tutorial hackathon)

authors = ["Carla Valdivia", "Jorge Cabrera", "André Digiorno"]

puts "Creating 8 articles..."

8.times do |i|
  article = Article.new(
    title: Faker::Lorem.sentence(word_count: rand(6..8)),
    subtitle: Faker::Lorem.sentence(word_count: rand(5..7)),
    category: categories.sample,
    author: authors.sample,
    body: Faker::Lorem.paragraphs(number: rand(20..30)).join
  )

  article.save!

  puts "Created article n. #{i + 1}."
end