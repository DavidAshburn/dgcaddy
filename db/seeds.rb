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

all_courses = JSON.parse(File.read(Rails.root.join('db/courses.json')))

all_courses.each do |course|
	Course.create(
		name: course['Name'],
		city: course['City'],
		state: course['State']
		)
end