# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
HealthProgram.destroy_all
Client.destroy_all
Enrollment.destroy_all

# Create Health Programs
health_programs = [
  {
    name: "Tuberculosis (TB) Program",
    description: "A comprehensive program for TB prevention, diagnosis, and treatment. Includes regular check-ups and medication management.",
    active: true
  },
  {
    name: "Malaria Control Program",
    description: "Program focused on malaria prevention, early detection, and treatment. Includes mosquito net distribution and education.",
    active: true
  },
  {
    name: "HIV/AIDS Care Program",
    description: "Support and treatment program for HIV/AIDS patients. Includes antiretroviral therapy and counseling services.",
    active: true
  },
  {
    name: "Maternal Health Program",
    description: "Prenatal and postnatal care program for expecting and new mothers. Includes regular check-ups and education.",
    active: true
  },
  {
    name: "Diabetes Management Program",
    description: "Program for diabetes prevention and management. Includes regular monitoring and lifestyle counseling.",
    active: true
  }
]

health_programs.each do |program|
  HealthProgram.create!(program)
end

# Create Clients
clients = [
  {
    first_name: "John",
    last_name: "Doe",
    date_of_birth: "1985-06-15",
    gender: "male",
    address: "123 Main St, Cityville",
    phone_number: "+1234567890",
    email: "john.doe@example.com"
  },
  {
    first_name: "Jane",
    last_name: "Smith",
    date_of_birth: "1990-03-22",
    gender: "female",
    address: "456 Oak Ave, Townsville",
    phone_number: "+1987654321",
    email: "jane.smith@example.com"
  },
  {
    first_name: "Michael",
    last_name: "Johnson",
    date_of_birth: "1978-11-30",
    gender: "male",
    address: "789 Pine Rd, Villageton",
    phone_number: "+1122334455",
    email: "michael.johnson@example.com"
  },
  {
    first_name: "Sarah",
    last_name: "Williams",
    date_of_birth: "1995-08-10",
    gender: "female",
    address: "321 Elm St, Hamletville",
    phone_number: "+1555666777",
    email: "sarah.williams@example.com"
  },
  {
    first_name: "David",
    last_name: "Brown",
    date_of_birth: "1982-04-18",
    gender: "male",
    address: "654 Maple Dr, Countryside",
    phone_number: "+1444333222",
    email: "david.brown@example.com"
  }
]

clients.each do |client|
  Client.create!(client)
end

# Create Enrollments
enrollments = [
  {
    client: Client.find_by(email: "john.doe@example.com"),
    health_program: HealthProgram.find_by(name: "Tuberculosis (TB) Program"),
    enrollment_date: "2024-01-15",
    status: "active"
  },
  {
    client: Client.find_by(email: "john.doe@example.com"),
    health_program: HealthProgram.find_by(name: "Diabetes Management Program"),
    enrollment_date: "2024-02-01",
    status: "active"
  },
  {
    client: Client.find_by(email: "jane.smith@example.com"),
    health_program: HealthProgram.find_by(name: "Maternal Health Program"),
    enrollment_date: "2024-03-10",
    status: "active"
  },
  {
    client: Client.find_by(email: "michael.johnson@example.com"),
    health_program: HealthProgram.find_by(name: "HIV/AIDS Care Program"),
    enrollment_date: "2024-01-20",
    status: "active"
  },
  {
    client: Client.find_by(email: "sarah.williams@example.com"),
    health_program: HealthProgram.find_by(name: "Malaria Control Program"),
    enrollment_date: "2024-02-15",
    status: "active"
  },
  {
    client: Client.find_by(email: "david.brown@example.com"),
    health_program: HealthProgram.find_by(name: "Tuberculosis (TB) Program"),
    enrollment_date: "2024-03-01",
    status: "active"
  },
  {
    client: Client.find_by(email: "david.brown@example.com"),
    health_program: HealthProgram.find_by(name: "Diabetes Management Program"),
    enrollment_date: "2024-03-05",
    status: "active"
  }
]

enrollments.each do |enrollment|
  Enrollment.create!(
    client_id: enrollment[:client].id,
    health_program_id: enrollment[:health_program].id,
    enrollment_date: enrollment[:enrollment_date],
    status: enrollment[:status]
  )
end

puts "Seed data created successfully!"
puts "#{HealthProgram.count} health programs created"
puts "#{Client.count} clients created"
puts "#{Enrollment.count} enrollments created"
