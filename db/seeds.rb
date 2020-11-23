# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

admin = AdminUser.find_by(email: 'admin@example.com')
AdminUser.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password') unless admin

user1 = User.find_by(email: 'user1@yahoo.com')
unless user1.present?
  user1 = User.create(name: 'user1', username: 'user123', email: 'user1@yahoo.com', password: 'password', password_confirmation: 'password')
  CreateDatabaseJob.perform_now(user: user1, password: 'password')
end