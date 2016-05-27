venue = Venue.create(name: "Speakeasy", address: "Lynwood Ave", zip_code: "30312")
artist = Artist.create(name: "DJ Sliink", bio: "jersey club king")
artist2 = Artist.create(name: "DJ Spinn", bio: "Teklife's chief spokesperson")

event = Event.create(name: "Dance your ass off",
                      date: DateTime.new(2016,2,3,10,0,0,'+7'),
                      venue_id: venue.id,
                      description: "turn up")
event.artists << artist
event.artists << artist2
