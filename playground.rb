# if you have not installed the needed gems, please do the following:
# gem install sqlite3
# gem install activerecord

require "sqlite3"
require "active_record"

# this line configures ActiveRecord to connect to a sqlite3 database in the same folder named "students.sqlite3"
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => "./students.sqlite3")

# This sets up ActiveRecord to use Ruby OOP with SQL data
class Student < ActiveRecord::Base
end

####################################
# Write your test code here

# 1. Create a new student using new and save
student = Student.new(name: "Harry Potter", email: "harry@example.com", age: 18)
student.save
p student

# 2. Create a new student using create
student = Student.create(name: "Luke Watt", email: "luke@example.com", age: 23)

# 3. Select all students
student = Student.all
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
# Student.all is an Active Record relation object, as its an array of Active Record entries
# Why can't you do Student.name or Student.email?
# Because Student is a class, not the instance

# 4. Select the first student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.first

#<Student id: 1, name: "Grayson Bednar", email: "emmy@schneider.net", age: 20, created_at: "2017-02-26 12:16:22", updated_at: "2017-02-26 12:16:22">

# 5. Select the last student
# pay attention to the object that is returned to you, is it a Student object or Active Record relation object?
p Student.last
#<Student id: 22, name: "Luke Watt", email: "luke@example.com", age: 23, created_at: "2017-04-05 04:55:01", updated_at: "2017-04-05 04:55:01">

# 6. Use each to iterate through the #<ActiveRecord::Relation> object to display the name of each student
Student.all.each do |student|
    p student.name
end

# 7. Find student by the name Dr. Lois Pfeff using where.
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?

student = Student.where(name: "Dr. Lois Pfeff")
p student

#<ActiveRecord::Relation [#<Student id: 6, name: "Dr. Lois Pfeff", email: "minnie@quitzon.org", age: 21, created_at: "2017-02-26 12:16:22", updated_at: "2017-02-26 12:16:22">]>

# What will the following return to you? (remember to comment out the code!)
# Doesnt work as .where returns an AR object, which you cant use class methods to access the variables
student = Student.first
p student.id #=>1
p student.name #=>"Grayson Bednar"
p student.email #=> "emmy@schneider.net"
p student.age #=>20

# Student is the first entry in the table

# 8. Find student by name using find_by
# pay attention to the object that is returned to you, is it the Student object or Active Record relation object?
student = Student.find_by(name: "Dr. Lois Pfeff")
p student

#<Student id: 6, name: "Dr. Lois Pfeff", email: "minnie@quitzon.org", age: 21, created_at: "2017-02-26 12:16:22", updated_at: "2017-02-26 12:16:22">

# What will the following return to you?
student = Student.find_by(name: "Dr. Lois Pfeff")
p student.id #=> 6
p student.name #=> "Dr. Lois Pfeff"
p student.email #=> "minnie@quitzon.org"
p student.age #=> 21

# Do research on the difference between "where" and "find_by".

# 9. Find the student with id = 7 using find and find_by
# pay attention to the object that is returned to you, is it the User object or Active Record relation object?
p Student.find(7)
p Student.find_by(id: 7)

#<Student id: 7, name: "Sofia Gleichne", email: "evalyn@feeney.org", age: 16, created_at: "2017-02-26 12:16:22", updated_at: "2017-02-26 12:16:22">
#<Student id: 7, name: "Sofia Gleichne", email: "evalyn@feeney.org", age: 16, created_at: "2017-02-26 12:16:22", updated_at: "2017-02-26 12:16:22">

# Same results

# 10. Update information for student with id = 5 using student.email and save. Change the student's email to elsie@example.com
student = Student.find(5)
p student
student.email = "elsie@example.com"
student.save
p student # check that the email has indeed been updated.

#<Student id: 5, name: "Elsie Ritchie", email: "myrna_bernier@leuschke.co", age: 20, created_at: "2017-02-26 12:16:22", updated_at: "2017-02-26 12:16:22">
#<Student id: 5, name: "Elsie Ritchie", email: "elsie@example.com", age: 20, created_at: "2017-02-26 12:16:22", updated_at: "2017-04-05 05:36:33">

# 11. Now use update to update this student's age to 21.
student = Student.find(5)
p student
student.update(age: 21)
p student

#<Student id: 5, name: "Elsie Ritchie", email: "elsie@example.com", age: 20, created_at: "2017-02-26 12:16:22", updated_at: "2017-04-05 05:36:33">
#<Student id: 5, name: "Elsie Ritchie", email: "elsie@example.com", age: 21, created_at: "2017-02-26 12:16:22", updated_at: "2017-04-05 05:37:26">

# 12. Delete student with id 21 using delete
student = Student.find(10)
student.delete
p Student.all.count

# => 21

# 13. Delete student with id 22 using destroy
student = Student.find(22)
student.destroy
p Student.all.count

# => 20

