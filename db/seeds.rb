scott = User.create(email: "ascotttoney@gmail.com", password: "123", first_name: "Scott", last_name: "Toney")
tun = User.create(email: "tunkhine@gmail.com", password: "123", first_name: "Tun", last_name: "Khine")

bruce = Artist.create(name: "Bruce Springsteen")
metallica = Artist.create(name: "Metallica")

darkness = Album.create(
  artist_id: bruce.id, name: "Darkness on the Edge of Town",
  tracks: "1. Badlands \n 2. Adam Raised a Cain \n 3. Something in the Night \n 4. Candy's Room \n 5. Racing in the Street",
  images: "https://images-na.ssl-images-amazon.com/images/I/81ChBQil4zL._SY355_.jpg"
)

darkness.reviews << Review.create(
  user_id: scott.id, album_id: darkness.id, title: "One of his best!",
  content: "Any album with 'Racing in the Street' on it is gold."
)

born = Album.create(
  artist_id: bruce.id, name: "Born to Run",
  tracks: "1. Thunder Road \n 2. Tenth Avenue Freeze-Out \n 3. Night \n 4. Backstreets \n 5. Born to Run",
  images: "https://images-na.ssl-images-amazon.com/images/I/8127ICDt45L._SY355_.jpg"
)

born.reviews << Review.create(
  user_id: scott.id, album_id: born.id, title: "When Bruce became The Boss!",
  content: "When Bruce became The Boss. One of the best of all time."
)

scott.collections << Collection.create(user_id: scott.id, album_id: darkness.id)
scott.collections << Collection.create(user_id: scott.id, album_id: born.id)
