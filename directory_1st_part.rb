def input_students
  puts "Welcome to the Student Directory".center(80)
  puts "Please fill in the form for each student."
  puts
  students = []
  default = "TBD"
  answer = ""
  name = ""
    while name != "done" do
      puts "NAME & COHORT - please insert a semicolon between the two (e.g. John Doe;November)."
      name, cohort = gets.chomp.split(';')
        if cohort == nil
          cohort = default
        end
      cohort = cohort.to_sym
      puts "COUNTRY OF BIRTH"
      # Solution to Step 8: Exercise 10
      country = gets
      country = country.gsub("\n", "")
      puts "HOBBIES"
      hobbies = gets.chomp
      puts "HEIGHT"
      height = gets.chomp
      puts "> You entered NAME: #{name}, COHORT: #{cohort}, COUNTRY OF BIRTH: #{country}, HOBBIES: #{hobbies}, HEIGHT: #{height}.\nDo you want to submit? Enter 'y' to submit or 'n' to fill in the info again."
      answer = gets.chomp
        if answer == "n"
          next
        else
      students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}
        if students.count == 1
          puts "Now we have #{students.count} student."
        else
          puts "Now we have #{students.count} students."
        end
       puts "Press RETURN to continue adding students, or type in 'done' to finish."
       choice = gets.chomp
        break if choice == "done"
          next
        end
      end
      students
  end

def print_header
  puts
  puts "The students of Villains Academy sorted by cohorts:"
  puts "-------------"
end

def print_students(students)
  cohorts = students.map {|x| x[:cohort]}.uniq
  cohorts.each do |cohort|
    i = 0
    while i <= students.length-1 do
        if students[i].has_value? cohort
         puts " #{students[i][:name]}, from #{students[i][:country]}. Hobbies: #{students[i][:hobbies]}. Height: #{students[i][:height]}. (Cohort: #{students[i][:cohort].upcase}) ".center(120, '*')
         i += 1
          next
        else
          i+= 1
          next
        end
    end
   end
 end

 def print_cohort(students)
   puts
   puts "Which students' cohort would you like to visualise? Type in a month or TBD."
   month = gets.chomp.to_sym
   students.each do |student|
     if student[:cohort] == month
       puts " #{student[:name]}, from #{student[:country]}. Hobbies: #{student[:hobbies]}. Height: #{student[:height]}. (Cohort: #{student[:cohort].upcase}) ".center(120, '*')
     end
   end
 end

def print_footer(names)
  puts "-------------"
  if names.count == 0
    puts "We have no students."
  elsif names.count == 1
    puts "Overall, we have 1 great student.\nNB: git'TBD' stands for 'To Be Determined'"
  else
    puts "Overall, we have #{names.count} great students.\nNB: 'TBD' stands for 'To Be Determined'"
  end
end

students = input_students
print_header
print_students(students)
print_footer(students)
print_cohort(students)
