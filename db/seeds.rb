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
blank_sheet = Timesheet.create(employee: acody, pay_period: sometime)
full_sheet = Timesheet.create(employee: bbrody, pay_period: sometime)
WorkEntry.create(
	timesheet: full_sheet, 
	start_time: '8:05am May 4, 2018', 
	end_time: '12:22pm May 4, 2018'
)
WorkEntry.create(
	timesheet: full_sheet, 
	start_time: '2:00pm May 4, 2018', 
	end_time: '5:55pm May 4, 2018'
)
WorkEntry.create(
	timesheet: full_sheet, 
	start_time: '8:00am May 6, 2018', 
	end_time: '6pm May 6, 2018'
)