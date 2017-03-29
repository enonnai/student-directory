def input_students
  # create an empty array
  students = []
  name = ""
  november = :november
  # while the name is not empty, repeat this code
    while name.empty? do
    # get the first name
    puts "Please enter the names of the students"
    name = gets.chomp
  # add the student hash to the array
     students << {name: name, cohort: november}
     puts "Now we have #{students.count} students"
     puts "To enter another name, hit return. To finish, type in 'ok'."
     #get another name from the user
      name = gets.chomp
    end
  # return the array of students
  students
end

def print_header
  puts
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students(students)
  students.each do |student|
        if student[:name] != ""
          puts "#{student[:name]} (#{student[:cohort]} cohort)"
        end
      end
end

def print_footer(students)
  puts "-------------"
   if students.count == 0
    puts "We have no students."
  elsif students.count == 1
    puts "Overall, we have 1 great student."
   else
    puts "Overall, we have #{students.count} great students."
   end
end

students = input_students
print_header
print_students(students)
print_footer(students)
