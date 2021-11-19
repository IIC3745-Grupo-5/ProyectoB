cinema = Cinema.create(name: 'DCCinema')

room1 = Room.create(name: 'Sala 1', cinema: cinema)
room2 = Room.create(name: 'Sala 2', cinema: cinema)
room3 = Room.create(name: 'Sala 3', cinema: cinema)
room4 = Room.create(name: 'Sala 4', cinema: cinema)
room5 = Room.create(name: 'Sala 5', cinema: cinema)
room6 = Room.create(name: 'Sala 6', cinema: cinema)
room7 = Room.create(name: 'Sala 7', cinema: cinema)
room8 = Room.create(name: 'Sala 8', cinema: cinema)

movie1 = Movie.create(
  title: 'Dune', 
  photo: 'https://pics.filmaffinity.com/Dune-367914309-large.jpg', 
  room: room1
)

movie2 = Movie.create(
  title: 'Dune 3D', 
  photo: 'https://i.pinimg.com/originals/ca/5b/91/ca5b9160371f176a522a110136e2dcc1.jpg', 
  room: room2
)

movie3 = Movie.create(
  title: 'Venom, Let there be Carnage', 
  photo: 'http://oyster.ignimgs.com/wordpress/stg.ign.com/2021/05/VNM2_OnLine_1400x2100_TSR_RD3DDCIMAX_02.jpg', 
  room: room3
)

movie4 = Movie.create(
  title: 'Eternals', 
  photo: 'https://m.media-amazon.com/images/M/MV5BMTExZmVjY2ItYTAzYi00MDdlLWFlOWItNTJhMDRjMzQ5ZGY0XkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_.jpg', 
  room: room4
)

movie5 = Movie.create(
  title: 'No Time to Die', 
  photo: 'https://pics.filmaffinity.com/Sin_tiempo_para_morir-525355918-large.jpg', 
  room: room5
)

movie6 = Movie.create(
  title: 'Jack in the Box', 
  photo: 'https://m.media-amazon.com/images/M/MV5BZTcwMGFlOGItNDhiNi00YzBmLWE1MzctMmY3MDRmOWY4ODcxXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_FMjpg_UX1000_.jpg', 
  room: room6
)

movie7 = Movie.create(
  title: 'Ghostbusters: Afterlife', 
  photo: 'https://m.media-amazon.com/images/M/MV5BMmZiMjdlN2UtYzdiZS00YjgxLTgyZGMtYzE4ZGU5NTlkNjhhXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg', 
  room: room7
)

movie8 = Movie.create(
  title: 'The French Dispatch', 
  photo: 'https://m.media-amazon.com/images/I/71nWfxOlCTL._AC_SL1398_.jpg', 
  room: room8
)

schedule1_1 = Schedule.create(time: 'Morning', movie: movie1)
schedule2_1 = Schedule.create(time: 'Afternoon', movie: movie1)
schedule3_1 = Schedule.create(time: 'Evening', movie: movie1)

schedule1_2 = Schedule.create(time: 'Morning', movie: movie2)
schedule2_2 = Schedule.create(time: 'Afternoon', movie: movie2)
schedule3_2 = Schedule.create(time: 'Evening', movie: movie2)

schedule1_3 = Schedule.create(time: 'Morning', movie: movie3)
schedule2_3 = Schedule.create(time: 'Afternoon', movie: movie3)
schedule3_3 = Schedule.create(time: 'Evening', movie: movie3)

schedule1_4 = Schedule.create(time: 'Morning', movie: movie4)
schedule2_4 = Schedule.create(time: 'Afternoon', movie: movie4)
schedule3_4 = Schedule.create(time: 'Evening', movie: movie4)

schedule1_5 = Schedule.create(time: 'Morning', movie: movie5)
schedule2_5 = Schedule.create(time: 'Afternoon', movie: movie5)
schedule3_5 = Schedule.create(time: 'Evening', movie: movie5)

schedule1_6 = Schedule.create(time: 'Morning', movie: movie6)
schedule2_6 = Schedule.create(time: 'Afternoon', movie: movie6)
schedule3_6 = Schedule.create(time: 'Evening', movie: movie6)

schedule1_7 = Schedule.create(time: 'Morning', movie: movie7)
schedule2_7 = Schedule.create(time: 'Afternoon', movie: movie7)
schedule3_7 = Schedule.create(time: 'Evening', movie: movie7)

schedule1_8 = Schedule.create(time: 'Morning', movie: movie8)
schedule2_8 = Schedule.create(time: 'Afternoon', movie: movie8)
schedule3_8 = Schedule.create(time: 'Evening', movie: movie8)

schedule1_1.rooms.push(room1, room2, room8)
schedule2_1.rooms.push(room3, room4)
schedule3_1.rooms.push(room1, room2, room3, room8)

schedule1_2.rooms.push(room4, room6, room7)
schedule2_2.rooms.push(room2, room3, room8)
schedule3_2.rooms.push(room5, room6)

schedule1_3.rooms.push(room1, room5)
schedule2_3.rooms.push(room5, room6, room7)
schedule3_3.rooms.push(room4, room8)

schedule1_4.rooms.push(room2, room3, room4)
schedule2_4.rooms.push(room1, room5)
schedule3_4.rooms.push(room5, room6, room8)

schedule1_5.rooms.push(room2, room3, room7, room8)
schedule2_5.rooms.push(room3, room4)
schedule3_5.rooms.push(room2, room3, room5)

schedule1_6.rooms.push(room1, room5)
schedule2_6.rooms.push(room8)
schedule3_6.rooms.push(room5, room7)

schedule1_7.rooms.push(room1, room2)
schedule2_7.rooms.push(room5, room6, room7)
schedule3_7.rooms.push(room3)

schedule1_8.rooms.push(room2, room5, room7)
schedule2_8.rooms.push(room3, room4, room5)
schedule3_8.rooms.push(room1, room6)