# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.find_or_create_by!(email: "admin@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
end

# ---------------------------------------------------------------------------
# School demo data — 50 records per model
# ---------------------------------------------------------------------------
puts "Seeding school demo data..."

StudentSubject.delete_all
Student.delete_all
Book.delete_all
Teacher.delete_all
Staff.delete_all
Subject.delete_all

SUBJECT_NAMES = [
  "Mathematics", "English Literature", "Physics", "Chemistry", "Biology",
  "World History", "Geography", "Computer Science", "Art", "Music",
  "Physical Education", "Economics", "Political Science", "Psychology", "Philosophy",
  "French", "Spanish", "Music Theory", "Statistics", "Environmental Science"
].freeze

subjects = 50.times.map do |i|
  base_name = SUBJECT_NAMES[i % SUBJECT_NAMES.length]
  round = i / SUBJECT_NAMES.length
  name = round.zero? ? base_name : "#{base_name} #{round + 1}"

  Subject.create!(
    name: name,
    code: "SUBJ-#{format('%03d', i + 1)}",
    description: Faker::Lorem.sentence(word_count: 12)
  )
end
puts "  Created #{subjects.size} subjects"

teachers = 50.times.map do |i|
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "teacher#{i + 1}@school.example.com",
    phone: Faker::PhoneNumber.phone_number,
    subject: subjects.sample,
    hire_date: Faker::Date.between(from: 10.years.ago, to: 1.month.ago),
    salary: rand(35_000..95_000),
    active: [true, true, true, false].sample
  )
end
puts "  Created #{teachers.size} teachers"

DESIGNATIONS = ["Administrator", "Librarian", "Accountant", "Receptionist", "Janitor",
                "IT Support", "Nurse", "Counselor", "Security Officer", "Coach"].freeze
DEPARTMENTS = ["Administration", "Library", "Finance", "Front Office", "Facilities",
               "IT", "Health", "Student Affairs", "Security", "Athletics"].freeze

staffs = 50.times.map do |i|
  Staff.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "staff#{i + 1}@school.example.com",
    phone: Faker::PhoneNumber.phone_number,
    designation: DESIGNATIONS.sample,
    department: DEPARTMENTS.sample,
    hire_date: Faker::Date.between(from: 10.years.ago, to: 1.month.ago),
    salary: rand(28_000..70_000),
    active: [true, true, true, false].sample
  )
end
puts "  Created #{staffs.size} staff members"

books = 50.times.map do |i|
  Book.create!(
    title: Faker::Book.unique.title,
    isbn: Faker::Code.unique.isbn,
    author: Faker::Book.author,
    subject: subjects.sample,
    published_on: Faker::Date.between(from: 30.years.ago, to: Date.today),
    copies_count: rand(1..25),
    available: [true, true, true, false].sample
  )
end
puts "  Created #{books.size} books"

GRADES = (1..12).map(&:to_s).freeze

students = 50.times.map do |i|
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "student#{i + 1}@school.example.com",
    phone: Faker::PhoneNumber.phone_number,
    date_of_birth: Faker::Date.between(from: 18.years.ago, to: 5.years.ago),
    grade: GRADES.sample,
    enrollment_number: "ENR-#{format('%04d', i + 1)}",
    teacher: teachers.sample,
    active: [true, true, true, false].sample
  )
end
puts "  Created #{students.size} students"

students.each { |student| student.subjects = subjects.sample(rand(2..5)) }
puts "  Enrolled students into subjects"

puts "Done seeding school demo data."
