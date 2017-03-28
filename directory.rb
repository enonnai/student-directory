def input_students
  puts "Please enter the required information for each student"
  puts "To finish, please type in 'done' when asked for the NAME of the next sudent."
  #create an empty array
  students = []
  #get the first name
  puts "NAME:"
  name = gets.chomp
  puts "COUNTRY OF BIRTH:"
  country = gets.chomp
  puts "HOBBIES:"
  hobbies = gets.chomp
  puts "HEIGHT:"
  height = gets.chomp
  #while the name is not empty, repeat this code
    while !name.empty? do
      #add the student hash to the array
      students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height}
      puts "Now we have #{students.count} students"
      #get another username from the user
      puts "NAME:"
      name = gets.chomp
      break if name == "done"
      puts "COUNTRY OF BIRTH:"
      country = gets.chomp
      puts "HOBBIES:"
      hobbies = gets.chomp
      puts "HEIGHT:"
      height = gets.chomp
    end
#return the array of students
students
end

# let's put all students into an array
=begin
students = [
{name: "Dr. Hannibal Lecter", cohort: :november},
{name: "Darth Vader", cohort: :november},
{name: "Nurse Ratched", cohort: :november},
{name: "Michael Corleone", cohort: :november},
{name: "Alex DeLarge", cohort: :november},
{name: "The Wicked Witch of the West", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "Freddy Krueger", cohort: :november},
{name: "The Joker", cohort: :november},
{name: "Joffrey Baratheon", cohort: :november},
{name: "Norman Bates", cohort: :november}
]
=end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
=begin
def print(students)
  students.each_with_index do |student, index|
    #if student[:name].start_with? "D"
    if student[:name].length < 12
     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
=end
def print(students)
  i = 0
  while i <= students.length-1
    puts "#{students[i][:name]}, from #{students[i][:country]}. Hobbies: #{students[i][:hobbies]}. Height: #{students[i][:height]}. (#{students[i][:cohort].capitalize} cohort)"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
