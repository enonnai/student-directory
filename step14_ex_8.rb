puts "WELCOME TO GUYBRUSH, CRISTINA'S SHORT PROGRAM".center(100)
puts
def dashes
  puts '-' * 30
end
def stars
  puts '*' * 30
end
puts "The plan is to to print Guybrush's code, so you can know a little bit more about him.\nWould you like to continue? Hit 'y' for yes or 'n' for no."

dashes
answer = gets.chomp
if answer == "y"
  puts "Excellent! Let's get started (HIT RETURN TO CONTINUE)"
  dashes
  continue = gets.chomp
  puts "First of all, Guybrush is saved into a file named '#{$0}'. Find Guybrush's surname and profession hiding in the code!\nIf you can't find it, Guybrush will reveal it to you after the code is printed.\nPrint the code, now! (HIT RETURN TO CONTINUE)"
  dashes
  continue = gets.chomp
  stars
  stars
  File.open($0, "r") do |file|
    file.readlines.each do |line|
      puts line
    end
  end
elsif answer != "yes"
  puts "I see, you're not too intrigued. Guybrush is sad now, anyway he waves you 'Goodbye'!"
  exit
end

class Person
  def initialize(name, surname, profession)
    @name = name
    @surname = surname
    @profession = profession
  end

  attr_accessor :name, :surname, :profession

  def speak
    puts "\n> SOLUTION: 'I\'m #{@name} #{@surname} and I'm a mighty #{@profession}'!"
  end
end

guess_who = Person.new("Guybrush", "Threepwood", :pirate)
stars
stars
guess_who.speak
