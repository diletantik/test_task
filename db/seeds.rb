# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	ticket_statuses = TicketStatus.create([{name: 'Waiting for Staff Response'}, {name: 'Waiting for Customer'}, {name: 'On Hold'}, {name: 'Cancelled'}, {name: 'Completed'}])
	
