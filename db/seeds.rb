# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Container.create(title:"Camion 1",origin:"Cali",destiny:"Bogota",shipping_day:"22/04/2017")
Container.create(title:"Camion 2",origin:"Bogotá",destiny:"Barranquilla",shipping_day:"22/04/2017")
Container.create(title:"Camion 3",origin:"Medellin",destiny:"Popayan",shipping_day:"22/04/2017")
Container.create(title:"Camion 4",origin:"Bogotá",destiny:"Medellin",shipping_day:"22/04/2017")