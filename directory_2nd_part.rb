@students = []

def print_menu
  puts "-------------"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
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
  when "9"
    puts "You have correctly exited the program. Goodbye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end


def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_to_array(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def add_to_array(name)
@students << {name: name, cohort: :november}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer
  puts "-------------\nOverall, we have #{@students.count} great students"
end

def save_students
  puts "To which file would you like to save the list?"
  input = STDIN.gets.chomp
  File.open(input, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "The list has been saved to #{input}"
end

def load_students
  puts "From which file would you like to open the list?"
  input = STDIN.gets.chomp
  File.open(input, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_to_array(name)
    end
  end
  puts "The list from #{input} has been loaded"
end

def load_with_file
  filename = ARGV.first
    filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    File.open(filename, "r") do |file|
      file.readlines.each do |line|
        name, cohort = line.chomp.split(',')
        add_to_array(name)
      end
    end
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

load_with_file
interactive_menu
