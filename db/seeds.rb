# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

mavericks = Team.create(name: 'mavericks')
orion = Team.create(name: 'orion')
hurricanes = Team.create(name: 'hurricanes')
pacific = Team.create(name: 'pacific')
stark = Team.create(name: 'stark')

deepak = User.create(email: 'deepak@oncehub.com', password: 'oncehub1234', first_name: 'deepak', last_name: 'manwal', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
mun = User.create(email: 'munmun@oncehub.com', password: 'oncehub1234', first_name: 'mun', last_name: 'sarkar', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
sid = User.create(email: 'siddharth@oncehub.com', password: 'oncehub1234', first_name: 'sid', last_name: 'sahi', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
ravi = User.create(email: 'ravi@oncehub.com', password: 'oncehub1234', first_name: 'ravi', last_name: 'rawat', country: 'India', about: 'I am developer', hobbies: 'playing cricket')

mavericks.members << [deepak, mun, sid, ravi]
mavericks.members.each { |member| member.add_role :developer }

nagi = User.create(email: 'nagi@oncehub.com', password: 'oncehub1234', first_name: 'nagi', last_name: 'rawat', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
priyank = User.create(email: 'priyank@oncehub.com', password: 'oncehub1234', first_name: 'priyank', last_name: 'kothiyal', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
orion.members << [nagi, priyank]
orion.members.each { |member| member.add_role :developer }


amuk = User.create(email: 'amuk@oncehub.com', password: 'oncehub1234', first_name: 'amuk', last_name: 'saxena', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
rajat = User.create(email: 'rajat@oncehub.com', password: 'oncehub1234', first_name: 'rajat', last_name: 'saxena', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
hurricanes.members << [amuk, rajat]
hurricanes.members.each { |member| member.add_role :developer }


ashish_sati = User.create(email: 'ashish.sati@oncehub.com', password: 'oncehub1234', first_name: 'ashish', last_name: 'sati', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
pacific.members << [ashish_sati]
pacific.members.each { |member| member.add_role :developer }

abhinav = User.create(email: 'abhi@oncehub.com', password: 'oncehub1234', first_name: 'abhi', last_name: 'gangwar', country: 'India', about: 'I am developer', hobbies: 'playing cricket')
stark.members << [abhinav]
pacific.members.each { |member| member.add_role :developer }


bharat = User.create(email: 'bharat@oncehub.com', password: 'oncehub1234', first_name: 'bharat', last_name: 'manola', country: 'India', about: 'I am SM', hobbies: 'playing cricket')
bharat.add_role :sm
mavericks.members << bharat

ashish_negi = User.create(email: 'ashish@oncehub.com', password: 'oncehub1234', first_name: 'ashish', last_name: 'negi', country: 'India', about: 'I am SM', hobbies: 'playing cricket')
ashish_negi.add_role :sm
orion.members << ashish_negi