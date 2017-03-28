def input_students
  puts "Please fill in the form for each student."
  puts "To finish, please type in 'done' when asked for NAME & COHORT."
  puts
  students = []
  default = "TBD"
  answer = ""

name = ""
    while name != "done" do
      puts "NAME & COHORT - please insert a dot between the two, (e.g. John Doe. November) or type in 'done.' to finish."
      name, cohort = gets.split('.')
      break if name == "done"
      name.to_s
        if cohort == nil
          cohort = default
          cohort_sym = cohort.to_sym
        end
      cohort_sym = cohort.downcase.to_sym
      puts "COUNTRY OF BIRTH"
      country = gets.chomp
      puts "HOBBIES"
      hobbies = gets.chomp
      puts "HEIGHT"
      height = gets.chomp
      puts "Are you happy to submit? Type in 'yes' or 'no' to fill in the info again."
      answer = gets.chomp
        if answer == "no"
          next
        else
      students << {name: name, cohort: cohort_sym, hobbies: hobbies, country: country, height: height}
      puts "Now we have #{students.count} students"
      puts
      #puts cohort_sym.is_a? Symbol
        next
    end
      #get another username from the user
    end
#return the array of students
students
end

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
    puts " #{students[i][:name].capitalize}, from #{students[i][:country].capitalize}. Hobbies: #{students[i][:hobbies]}. Height: #{students[i][:height]}. (Cohort:#{students[i][:cohort].upcase}) ".center(120, '*')
    i += 1
  end
end

def print_footer(names)
  puts "-------------"
  puts "Overall, we have #{names.count} great students.\n\nNB: 'TBD' stands for 'To Be Determined'"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
