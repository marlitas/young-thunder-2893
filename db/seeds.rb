Role.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all

studio1 = Studio.create!(name: 'Paramount Pictures', location: 'Hollywood')
studio2 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

potter = studio2.movies.create!(title: 'Harry Potter', creation_year: 2005, genre: 'fantasy')
raiders = studio2.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'adventure')

godfather = studio1.movies.create!(title: 'The Godfather', creation_year: 1972, genre: 'drama')
gun = studio1.movies.create!(title: 'The Naked Gun', creation_year: 1988, genre: 'comedy')

al = Actor.create!(name: 'Al Pacino', age:81)
marlon = Actor.create!(name: 'Marlon Brando', age: 70)
diane = Actor.create!(name: 'Diane Keaton', age: 75)
steve = Actor.create!(name: 'Steve Martin', age: 62)
daniel = Actor.create!(name: 'Daniel Radcliffe', age: 32)
ford = Actor.create!(name: 'Harrison Ford', age: 58)


godfather.actors << [al, marlon, diane]
gun.actors << steve
potter.actors << daniel
raiders.actors << ford
