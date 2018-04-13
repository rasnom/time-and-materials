# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Timesheet.delete_all
Employee.delete_all
PayPeriod.delete_all


acody = Employee.create(full_name: "Angstrom Cody")
bbrody = Employee.create(full_name: "Bob Brody")
sometime = PayPeriod.create(end_date: "February 6, 1999")
Timesheet.create(employee: acody, pay_period: sometime)
Timesheet.create(employee: bbrody, pay_period: sometime)