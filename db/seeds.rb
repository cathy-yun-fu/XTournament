# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users_list = [
    ["1@email.com","password","password"],
    ["2@email.com","password","password"],
    ["3@email.com","password","password"],
    ["4@email.com","password","password"],
    ["5@email.com","password","password"],
    ["6@email.com","password","password"],
    ["7@email.com","password","password"],
]
users_list.each do |email, password, valid_password|
    user = User.new
    user.email = email
    user.password = password
    user.password_confirmation = valid_password
    user.save!
end

people_list = [
	["FirstName1", "LastName1", "01-01-1991", "111-111-1111", "loc1",User.first.id],
    ["FirstName2", "LastName2", "02-02-1992", "222-222-2222", "loc2",User.second.id],
    ["FirstName3", "LastName3", "03-03-1993", "333-333-3333", "loc3",User.third.id],
    ["FN3", "LN3", "04-14-1994", "444-444-4444", "loc4",User.fourth.id],
    ["FN4", "LN4", "05-15-1995", "555-555-5555", "loc5",User.fifth.id],
    ["FN5", "LN5", "06-26-1996", "666-666-6666", "loc6",User.where(id: 6)],
    ["FN6", "LN6", "10-30-1950", "777-777-7777", "loc7",User.where(id: 7)]
]

people_list.each do |firstname,lastname,dob,phone,location,user_id|
	Person.create(firstname: firstname, lastname: lastname, dob: dob, phone: phone, location: location, user_id: user_id)
end

golfcourse_list = [
	["golfn1","loc1"],["golfn2","loc2"],["golfn3","loc3"],["golfn4","loc4"],["golfn5","loc5"],["golfn6","loc6"],["golfn7","loc7"]
]

golfcourse_list.each do |name,location|
	GolfCourse.create(name: name, location: location)
end

tournaments_list = [
	["tourname1","description1", true, "extrafeatures1",GolfCourse.first.id],["tourname2","description2", true, "extrafeatures2",GolfCourse.first.id],["tourname3","description3", true, "extrafeatures3",GolfCourse.second.id],["tourname4","description4", false, "extrafeatures4",GolfCourse.second.id],
	["tourname5","description5", false, "extrafeatures5",GolfCourse.second.id],["tourname6","desc6", false, "extraf6",GolfCourse.first.id]
]

tournaments_list.each do |name, description, ispublic, extrafeatures, golfid|
	Tournament.create(name: name, description: description, ispublic: ispublic, extrafeatures: extrafeatures, golf_course_id: golfid)
end

teams_list = [
	["team1", Tournament.first.id], ["team2", Tournament.first.id], ["team3", Tournament.first.id], ["team4", Tournament.second.id],["team5", Tournament.second.id],["team6", Tournament.fourth.id],["team6", Tournament.fourth.id]
]

teams_list.each do |name, tournamentid|
	Team.create(name: name, tournament_id: tournamentid)
end

tickets_list = [
	[1,Person.first.id],
    [2,Person.second.id],
    [3,Person.third.id],
    [2,Person.fourth.id],
    [1,Person.fifth.id]
]

tickets_list.each do |tickettype, person_id|
	Ticket.create(tickettype: tickettype,person_id: person_id )
end

registered_team_list = [
	["rtname1",Person.first.id,Tournament.first.id],["rtname2",Person.second.id,Tournament.first.id],["rtname3",Person.third.id,Tournament.third.id],["rtname4",Person.fourth.id,Tournament.first.id]
]

registered_team_list.each do |name,  person_id, tournament_id|
	RegisteredTeam.create(name: name, person_id: person_id, tournament_id: tournament_id)
end

website_admins_list = [
	[ Person.first.id,1], [Person.second.id,0],[Person.third.id,2],[Person.fourth.id,0],[Person.fifth.id,2]
]

website_admins_list.each do |person_id, adminrights|
	WebsiteAdmin.create(person_id: person_id, adminrights: adminrights)
end

tournament_organizers_list = [
	[Person.first.id,Tournament.first.id, 0],[Person.second.id,Tournament.first.id, 1],[Person.third.id,Tournament.third.id, 1],[Person.fourth.id,Tournament.first.id, 0]
]

tournament_organizers_list.each do | person_id, tournament_id, adminrights|
	TournamentOrganizer.create(person_id: person_id, tournament_id: tournament_id, adminrights: adminrights)
end

golf_course_organizers_list = [
	[Person.first.id,GolfCourse.first.id, 0],[Person.second.id,GolfCourse.first.id, 1],[Person.third.id,GolfCourse.third.id, 1],[Person.fourth.id,GolfCourse.first.id, 0]
]

golf_course_organizers_list.each do | person_id, golf_course_id, adminrights|
	GolfCourseOrganizer.create(person_id: person_id, golf_course_id: golf_course_id, adminrights: adminrights)
end

sponsors_list = [
	[Person.third.id,Tournament.first.id],[Person.fifth.id,Tournament.first.id],[Person.third.id,Tournament.third.id],[Person.fourth.id,Tournament.first.id]
]

sponsors_list.each do |person_id, tournament_id|
	Sponsor.create(person_id: person_id, tournament_id: tournament_id)
end

players_list = [
	[Person.third.id,Tournament.first.id],[Person.fifth.id,Tournament.first.id],[Person.third.id,Tournament.third.id],[Person.fourth.id,Tournament.first.id]
]

players_list.each do |person_id, tournament_id|
	Player.create(person_id: person_id, tournament_id: tournament_id)
end