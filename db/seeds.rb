# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dani = User.create!(name: 'Dani', tuid: '258909348')
space = Space.create!(name: '#bookcamping', user: dani)
page = Page.create!(title: '#bookcamping', space: space, user: dani)

