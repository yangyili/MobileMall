# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = AdminManagement::AdminManagementUser.find_by(admin:"admin")
if admin.nil?
  admin = AdminManagement::AdminManagementUser.new :name => "admin", :email => "admin@admin.com", :password => "admin", :phone => "18733171780" , :admin => "admin"
  admin.save
end

seller = AdminManagement::AdminManagementUser.find_by(admin:"seller")
if seller.nil?
  seller = AdminManagement::AdminManagementUser.new :name => "seller", :email => "seller@seller.com", :password => "seller" , :phone => "18733171781", :admin => "seller"
  seller.save
end

customer = AdminManagement::AdminManagementUser.find_by(admin:"customer")
if customer.nil?
  customer = AdminManagement::AdminManagementUser.new :name => "customer", :email => "customer@customer.com", :password => "customer" , :phone => "18733171782", :admin => "customer"
  customer.save
end