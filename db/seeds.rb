# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

all_discs = JSON.parse(File.read(Rails.root.join('db/pdga.json')))

all_discs.each do |disc|
	Disc.create(
		user_id: disc["user_id"],
		maker: disc['Maker'],
		model: disc['Model'],
		weight: disc['Weight'],
		diameter: disc['Diameter'],
		height: disc['Height'],
		depth: disc['Depth'],
		rimdiameter: disc['RimDiameter'],
		rimthickness: disc['RimThickness'],
		rimratio: disc['RimRatio'],
		rimconfig: disc['RimConfig'],
		flexibility: disc['Flexibility']
		)
end

User.create(
	email:"disc@golf.com",
	password: "discgolf",
	password_confirmation: "discgolf"
	)

all_courses = JSON.parse(File.read(Rails.root.join('db/courses.json')))

all_courses.each do |course|
	Course.create(
		name: course['Name'],
		city: course['City'],
		state: course['State'],
		user_id: 0
		)
end

Variant.create(
	name: "Front 9",
	length: 9,
	pars: "333433343",
	course_id: 1
	)

Variant.create(
	name: "Back 9",
	length: 9,
	pars: "433343333",
	course_id: 1
	)

Variant.create(
	name: "Green to Green",
	length: 18,
	pars: "333433343433343333",
	course_id: 1
	)

Card.create(
	score: 33,
	shots: "42B031A021A021A0211A05211A0321B0321A031C0",
	length: 9,
	user_id: 1,
	course_id: 1,
	variant_id: 1,
	)

Coursekey.create(
	pointer: 1,
	count: 1,
	user_id: 1
	)