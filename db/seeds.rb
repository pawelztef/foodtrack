a = Admin.new
a.first_name = "Jan"
a.last_name = "Jankowksi"
a.email = "food@food.com"
a.password = "password"
a.password_confirmation = "password"
a.phone = "78878778"
a.address_line1 = "12/2"
a.address_line2 = "Szkolna"
a.town = "Bobolice"
a.code = "88-888"
a.owner = true
a.skip_confirmation!
a.save!


10.times do |n| 
  track = Track.create( route_name: Faker::Pokemon.location,
                       truck: Faker::Vehicle.manufacture,
                       driver: Faker::Name.first_name,
                       description: Faker::Lorem.sentence(3))
  5.times do |n|
    stop = Stop.create(address_line1: Faker::Address.secondary_address,
                       address_line2: Faker::Address.street_name,
                       town: Faker::Address.city,
                       code: Faker::Address.postcode,
                       active: false,
                       date: '10/10/2010' )

    track.stops << stop
  end
  track.save!
end

20.times do |n|
  name = Faker::Book.unique.title
  post = Post.new( title: name,
                  slug: name,
                  publish: false,
                  publish_date: Faker::Date.between(3.years.ago, Date.today),
                  body: Faker::Lorem.paragraph,
                  excerpt: Faker::Lorem.paragraph)
  post.save!

end

10.times do |n|
  post = Post.find(n+1)
  post.publish = true
  post.save!
end

6.times do |n|
  product = Product.new(name: "Product #{n+1}",
                        slug: "Product #{n+1}",
                        price: "#{n+1}0.20",
                        image: Rails.root.join("app/assets/images/mock#{n+1}.jpg").open,
                        description: Faker::Lorem.paragraph,
                        catchphrase: Faker::Lorem.paragraph,
                        publish: true,
                        expose: true)
  product.save

end


