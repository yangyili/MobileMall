# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = AdminManagement::AdminManagementUser.find_by(admin:true)
if admin.nil?
  admin = AdminManagement::AdminManagementUser.new :name => "admin", :email => "admin@admin.com", :password => "admin", :phone => "18733171780" , :admin => true
  admin.save
end

user = AdminManagement::AdminManagementUser.find_by_name("dev")
if user.nil?
  user = AdminManagement::AdminManagementUser.new :name => "dev", :email => "dev@dev.com", :password => "dev" , :phone => "18733171781"
  user.save
end