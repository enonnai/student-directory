require 'csv'
@students = []

def print_menu
  puts " MAIN MENU ".center(120, '-')
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "5. Print all the students sorted by cohort"
  puts "6. Print the students from a specific cohort"
  puts "7. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    print_by_cohort
  when "6"
    print_cohort
  when "7"
    puts "You have correctly exited the program. Goodbye!"
    exit
  else
    puts "I don't know what you mean, please try again."
  end
end

def input_students
  default = "TBD"
  answer = ""
  name = ""
    while name != "done" do
      puts "NAME & COHORT - please insert a semicolon between the two (e.g. John Doe;November)."
      name, cohort = STDIN.gets.chomp.split(';')
        if cohort == nil
          cohort = default
        end
      cohort = cohort.to_sym
      puts "COUNTRY OF BIRTH"
      country = STDIN.gets
      country = country.gsub("\n", "")
      puts "HOBBIES"
      hobbies = STDIN.gets.chomp
      puts "HEIGHT"
      height = STDIN.gets.chomp
      puts "> You entered NAME: #{name}, COHORT: #{cohort}, COUNTRY OF BIRTH: #{country}, HOBBIES: #{hobbies}, HEIGHT: #{height}.\nDo you want to submit? Enter 'y' to submit or 'n' to fill in the info again."
      answer = STDIN.gets.chomp
        if answer == "n"
          next
        else
      @students << {name: name, cohort: cohort, hobbies: hobbies, country: country, height: height}
        if @students.count == 1
          puts "Now we have #{@students.count} student."
        else
          puts "Now we have #{@students.count} students."
        end
       puts "Press RETURN to continue adding students, or type in 'done' to finish."
       choice = STDIN.gets.chomp
        break if choice == "done"
          next
        end
      end
      @students
  end

def show_students
  print_student_list
  print_footer
end

def print_student_list
 @students.each {|student| puts " #{student[:name]}, from #{student[:country]}. Hobbies: #{student[:hobbies]}. Height: #{student[:height]}. (Cohort: #{student[:cohort].upcase}) ".center(120, '*')}
end

def print_footer
  puts "-------------\nOverall, we have #{@students.count} great students"
end

def print_by_cohort
  puts "The students of Villains Academy sorted by cohorts:"
  puts "-------------"
  cohorts = @students.map {|x| x[:cohort]}.uniq.sort
  cohorts.each do |cohort|
    students_in_cohort = @students.select {|x| x.has_value? cohort }
      students_in_cohort.each do |student|
        puts " #{student[:name]}, from #{student[:country]}. Hobbies: #{student[:hobbies]}. Height: #{student[:height]}. (Cohort: #{student[:cohort].upcase}) ".center(120, '*')
      end
  end
end

def print_cohort
  month = ""
  puts "\nWhich students' cohort would you like to visualise? Type in a month or TBD."
  month = STDIN.gets.chomp.upcase
    @students.each {|student| puts " #{student[:name]}, from #{student[:country]}. Hobbies: #{student[:hobbies]}. Height: #{student[:height]}. (Cohort: #{student[:cohort].upcase}) ".center(120, '*') if student[:cohort].upcase == month}
end

def print_footer
  puts "-------------"
  if @students.count == 0
    puts "We have no students."
  elsif @students.count == 1
    puts "Overall, we have 1 great student.\nNB: git'TBD' stands for 'To Be Determined'"
  else
    puts "Overall, we have #{@students.count} great students.\nNB: 'TBD' stands for 'To Be Determined'"
  end
end

def save_students
  puts "To which file would you like to save the list?"
  input = STDIN.gets.chomp
  CSV.open(input, "wb") do |csv_line|
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:country], student[:hobbies], student[:height]]
      csv_line.puts student_data
    end
  end
  puts "The list has been saved to #{input}"
end

def load_students
  puts "From which file would you like to open the list?"
  input = STDIN.gets.chomp
  CSV.foreach(input) do |row|
    @students << {name: row[0], cohort: row[1], country: row[2], hobbies: row[3], height: row [4]}
  end
  puts "The list from #{input} has been loaded"
end

def load_with_file
  filename = ARGV.first
    filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    CSV.foreach(filename) do |row|
        @students << {name: row[0], cohort: row[1], country: row[2], hobbies: row[3], height: row [4]}
    end
    puts " WELCOME TO THE STUDENT DIRECTORY ".center(120, '*')
    puts "> #{@students.count} students have been loaded from '#{filename}'."
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

load_with_file
interactive_menu
