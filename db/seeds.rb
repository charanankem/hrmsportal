# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



roles = ['admin', 'employee','manager']
roles.each do |role|
  Role.find_or_create_by(name: role)
end
 
employee=Employee.find_or_create_by(email: 'admin@zensark.com')
employee.password = 'admin123'
#employee.confirm_password='admin123'
employee.role_id = Role.find_by(name: 'admin').id
employee.save
