# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




user = User.create  name:"Admin",age: 22 ,gender:"male",address:"DHA" ,city:"lahore",phone:"03227579281",email:"admin@example.com", password:"111111", role_id: Role.where(name:"Admin").first.id
user = User.create  name:"Admin",age: 22 ,gender:"male",address:"DHA" ,city:"lahore",phone:"03221234578",email:"admin@tsm.com", password:"111111", role_id: Role.where(name:"Admin").first.id