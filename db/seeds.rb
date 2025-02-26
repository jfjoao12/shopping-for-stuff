require "uri"
require "open-uri"

Product.delete_all

image_client = Pexels::Client.new

39.times do
  p = Product.create(name:        Faker::Commerce.unique.product_name,
                     price_cents: rand(5000..100_000).to_i,
                     description: Faker::Hipster.sentence(word_count: rand(4..8)))

  puts "Creating #{p.name}"

  pexel_response = image_client.photos.search(p.name)
  downloaded_image = URI.parse(pexel_response.photos[0].src["medium"]).open
  p.image.attach(io: downloaded_image, filename: "m-#{p.name}.jpg")
end
