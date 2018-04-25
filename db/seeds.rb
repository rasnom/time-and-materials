# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
WorkEntry.delete_all
Timesheet.delete_all
Employee.delete_all
PayPeriod.delete_all


acody = Employee.create(full_name: "Angstrom Cody")
bbrody = Employee.create(full_name: "Bob Brody")
sometime = PayPeriod.create(end_date: "February 6, 1999")
stuff = Project.create(name: "stuff")
blank_sheet = Timesheet.create(employee: acody, pay_period: sometime)
full_sheet = Timesheet.create(employee: bbrody, pay_period: sometime)

WorkEntry.create(
	timesheet_id: full_sheet.id, 
	project_id: stuff.id,
	start_time: '1/1/2018 8:15', 
	end_time: '1/1/2018 8:40'
)
WorkEntry.create(
	timesheet_id: full_sheet.id,
	project_id: stuff.id,
	start_time: '2/5/2018 16:00', 
	end_time: '2/5/2018 18:00'
)
WorkEntry.create(
	timesheet_id: full_sheet.id,
	project_id: stuff.id, 
	start_time: '2/6/2018 8:00', 
	end_time: '2/6/2018 12:30'
)