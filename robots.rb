#!/usr/local/bin/ruby -w
# robots.rb,  Week 1 Day 3 assignment


class Robot
  attr_accessor :name, :height
  def initialize(name )
    @name   = name
    @height = 10
  end

  def say_hi
    puts "hi"
  end

  def say_name
    puts "My name is #{name}"
  end

  def method_missing(m, *args, &block)
    puts "Does not compute"
  end
end

class BendingUnit < Robot
  def initialize
  end

  def bend(objecttobend )
    puts ("Bend #{objecttobend}!")
  end
end

class ActorUnit < Robot
  def initialize
    @name = 'actor'
  end

  def change_name(newname )
    @name = newname
  end
end

rob = Robot.new("Robby")
puts ' '
puts 'Test Robot'
puts rob.name

ben = BendingUnit.new
puts ' '
puts 'Test BendingUnit'
puts ben.bend("crowbar")

ace = ActorUnit.new
puts ' '
puts "Test ActorUnit"
puts ace.name
ace.change_name("fred")
puts ace.name

# Adventure:  make an array of robots
puts ' '
puts "Adventure: make an array of Robots"

puts '  using each'
our_class = ['Rob', 'David', 'Nancy', 'Kalea', 'Laura', 'Dave',
'Demetra', 'Kendrick', 'Phil', 'Ben', 'Michael', 'Miguel', 'Chris']
student_array = []
our_class.each {|student|
  student_array << Robot.new(student.downcase)
  }
student_array.each do |student|
  puts student.name
end
puts '  using collect'
student_array = our_class.collect {|student|
  Robot.new(student.downcase)
  }
student_array.each do |student|
  puts student.name
end

# Demonstrate height defaults to 10
puts ' '
puts "Demonstrate height defaults to 10"
puts "  rob.height = #{rob.height}"

# Randomly assign the class of the Robot on creation
# there are three types, so its 1...3
puts ' '
puts "Randomly assign the lass of the Robot on creation"
student_array = our_class.collect {|student|
  Robot.new(student.downcase)
  }
student_array.each do |student|
  #puts student.name
end

# Test our understanding of Randomly
student_array.each {|student|
  robot_type = rand(1..3)
  case robot_type
  when 1
    puts "#{student.name} is a Robot"
  when 2
    puts "#{student.name} is a BendingUnit"
  when 3
    puts "#{student.name} is a ActorUnit"
  else
    puts "Rand error - Unidentified Flying Robot"
  end
}

# When Robot called with an undefined method..
# instead of responding with an error, say "Does not computer"
puts ' '
puts "When Robot called with an undefined method.."
puts "   instead of responding with an error, "
puts "   say 'Does not compute' "
puts "   puts rob.silly"
puts rob.silly
