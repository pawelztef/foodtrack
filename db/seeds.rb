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
