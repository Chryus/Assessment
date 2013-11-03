#ChristopherHaack_assessment.rb

### 1. Arrays

array = ["Blake", "Ashley", "Jeff"]

# a. Add an element to an array
array.push("Chris")
# b. Write a statement to print out all the elements of the array.
array.each { |name| puts name }
# c. Return the value at index 1.
puts array[1]
# d. Return the index for the value "Jeff".
puts array.index("Jeff")

### 2. Hashes
instructor = { name: "Ashley",
  age: 27
}

# a. Add a new key for location and give it the value "NYC".
instructor[:location] = "NYC"
# b. Write a statement to print out all the key/value pairs in the hash
instructor.each { |x, y| puts "#{x}: #{y}" }
# c. Return the name value from the hash.
puts instructor[:name]
# d. Return the key name for the value 27.
puts instructor.key(27)


######3 Nested Structures
school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

# a. Add a key to the school hash called "founded_in" and set it to the value 2013.
school[:founded_in] = 2013

# b. Add a student to the school's students' array.
school[:students].push({:name=>"Jasper", :grade=>"A++"})
# or do... school[:students][-1] = {:name => "Jasper", :grade => "A++"}

# c. Remove "Billy" from the students' array.
school[:students].delete({:name=>"Billy", :grade => "F"})
# or
#school[:students].delete_at(1)
# or 
#school[:students].delete_if {|student| student[:name] == "Billy"}

# d. Add a key to every student in the students array called "semester" and assign it 
#the value "Summer".
school[:students].each { |student| student.merge!({:semester=>"Summer"}) }

# e. Change Ashley's subject to "being almost better than Blake"
school[:instructors][1][:subject] = "being almost bettter than Blake"

=begin or do this...
instructor = school[:instructors].find {|instructor| instructor[:name] == "Ashley"}
instructor[:subject] = "being almost better than Blake"
=end

# f. Change Frank's grade from "A" to "F".
school[:students][1][:grade] = "F"


# g. Return the name of the student with a "B".
school[:students].each do |student|
  if student[:grade] == "B" then puts student[:name]
  end
end

#...or
student = school[:students].find { |student| student[:grade] == "B"}
puts student[:name]

#...or

school[:students].each do |student|
  puts student[:grade] == "B" ? student[:name] : "nope"
end


# h. Return the subject of the instructor "Jeff".

school[:instructors].each do |instructor|
  if instructor[:name] == "Jeff" then puts instructor[:subject]
  end
end

#or...
instructor = school[:instructors].find {|instructor| instructor[:name] == "Jeff"}
puts instructor[:subject]

#or...
school[:instructors].each do |instructor|
  puts instructor[:name] == "Jeff"? instructor[:subject] : "nope"
end

school[:students].each { |x, y| puts "#{x}: #{y}" }


#i. Write a statement to print out all the values in the school.

school.each do |key,value|
  if value.kind_of?(Array)
    value.each do |array_element|
      array_element.each do |key,value|
        puts value
      end
    end
  else
    puts value
  end
end
 
######4

#a.
# Create a method to return the grade of a student, given that student's name. 
def student_grade(school, student_name)
  school[:students].each do |student|
    if student[:name] == student_name
      puts "#{student[:name]}'s grade is #{student[:grade]}."
    end
  end
end

def student_grade1(school, student_name)
  student = school[:students].find {|student| student[:name] == student_name}
  puts "#{student[:name]}'s grade is #{student[:grade]}."
end

student_grade1(school, "Jasper")


# Then use it to refactor your work in 3.i.

#b Create a method to udpate a instructor's subject given the instructor and the new subject. 

def instructor_subject1(school, instructor_name, instructor_subject)
  school[:instructors].each do |instructor|
    if instructor[:name] == instructor_name
      instructor[:subject] = instructor_subject
      puts "#{instructor[:name]}'s new subject is #{instructor[:subject]}."
    end
  end
end

#Then use it to update Blake's subject to "being terrible".
instructor_subject1(school, "Blake", "being terrible")

=begin
school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}
=end

#### 3. 

# d. #To add a key & value inside an element within an array use merge! vs. 
# we use push to add an element to an array, without going inside the 
#element (see 4c)
school[:students].each { |student| student.merge!({:semester=>"Summer"}) }
puts school[:students]


#### 4.
# b. i.Create a method to udpate a instructor's subject given the. 
# instructor and the new subject. 

def instructor_subject(school, instructor_name, instructor_subject)
  school[:instructors].each do |instructor|
    if instructor[:name] == instructor_name
      instructor[:subject] = instructor_subject
      puts "#{instructor[:name]}'s new subject is #{instructor[:subject]}."
    end
  end
end

def instructor_subject1(school, instructor_name, instructor_subject)
  instructor = school[:instructors].find {|instructor| instructor[:name] == instructor_name}
  instructor[:subject] = instructor_subject
  puts "#{instructor[:name]}'s new subject is #{instructor[:subject]}."
end

# ii. Then use it to update Blake's subject to "being terrible".

instructor_subject(school, "Blake", "being ergonomic")
instructor_subject1(school, "Blake", "being terrible")

# c. i. Create a method to add a new student to the schools student array. 
=begin to add a new element to an array, without going inside the element, we use push
# vs. using .merge! in 3d
=end
def new_student(school, student_name, student_grade)
  new_student = {:name=>student_name, :grade=>student_grade}
  school[:students].push(new_student)
  puts school[:students]
end
# ii. Then use it to add yourself to the school students array.
new_student(school, "Chris", "A")

# d. Create a method that adds a new key at the top level of the school hash, given a key
# and value. 

def add_key(school, new_key, new_value)
  new_key_value_pair = {new_key => new_value}
  school.merge!(new_key_value_pair)
  puts school
end

#how do I add a key value to the top of the hash? unshift only works for arrays. 

# ii Then use it to add a "Ranking key with the value 1"

add_key(school, "Ranking", 1)

#### 5
# a. Create a bare bones class definition for a School class.
class School

end

# b. Define an initialize method for the School class.

class School
  def initialize()
  end
end

# i. Give your School class the instance variables: name, location, ranking, students, 
# instructors. NOTE: These variables should be of the same type as they are in the hash above.

class School

  def initialize()
    @name = name
    @location = location
    @ranking = ranking
    @students = students[]
    @instructors = instructors[]
  end
end

# ii. Rewrite your initialize method definition to take a parameter for each instance variable.
class School
  def initialize(name, location, ranking, students, instructors)
    @name = name
    @location = location
    @ranking = ranking
    @students = students[]
    @instructors = instructors[]
  end
end


# iii. Initialize each instance variable with the value of the corresponding parameter.

class School
  def initialize(name, location, ranking, students, instructors)
    @name = name
    @location = location
    @ranking = ranking
    @students = students[]
    @instructors = instructors[]
  end
end

# c. Create an attr_accessor for name, location, instructors, and students. Create an attr_reader for ranking.

class School
  attr_accessor :name, :location, :students, :instructors
  attr_reader :ranking
  
  def initialize(name, location, ranking, students, instructors)
    @name = name
    @location = location
    @ranking = ranking
    @students = students[{}]
    @instructors = instructors[{}]
  end
end

# d. Create a method to set ranking, given a ranking value.
def set_ranking(school, ranking_value)
  school[:ranking] = ranking_value
end
# e. Create a method to add a student to the school, given a name, a grade, and a semester.
def new_student(school, name, grade, semester)
   new_student = {:name=>name, :grade=>grade, :semester=>semester}
   school[:students].unshift(new_student)
   puts school[:students]
end

#new_student("Jane Adams", "Chris", "B", "Fall")


# f. Create a method to remove a student from the school, given a name.
def remove_student(school, student_name)
  school[:students].delete_if {|student| student[:name] == student_name}
end

# g. Create an array constant SCHOOLS that stores all instances of your School class.
SCHOOLS = [@name, @location, @ranking, @students, @instructors] 

# h. Create a class method reset that will empty the SCHOOLS constant.
def School.reset
  SCHOOLS.clear
end

###6.

# a. Create a Student class.
class Student
  def initialize(name, grade, semester)
    @name = name
    @grade = grade
    @semester = semester
end

max = Student.new("Max", "A+", "spring")
ralph = Student.new("Ralph", "C", "Fall")
donna = Student.new("Donna", "B", "Fall")

# b. Refactor your School instance methods to treat Students as an array of objects instead of an array of hashes.

#i Create a method to add a student to the school, given a name, a grade, and a semester.
def new_student(school, student_name)
 school[:students].unshift(student_name)
  puts school[:students]
end

#new_student("Jane Adams", "max")

#ii Create a method to remove a student from the school, given a name.
def remove_student(school, student_name)
  school[:students].delete(student_name)
end


# c. Create a method in the School class that finds a student by name and returns the correct Student object.
def School.find_student(school, student_name)
  student = school[:students].find {|student| student[:name] == student_name}
  puts student[:subject]
end
end

School.find_student(school, "Jasper")



###7.

#a.What should this Class print to the screen when defined/loaded?

  class Student

    def self.say_hello
      puts "hello"
    end

    say_hello
    puts self

  end

# hello
# Student

#b. What should this Class print to the screen when defined/loaded?

  class Student
 
    def self.say_hello
      puts self
    end
 
    say_hello
 
  end

# Student

#c. What should this Class print to the screen when defined/loaded?

  class Student
 
    def initialize
      puts self
    end
 
    new
 
  end

#<Student:0x007fa17883c540>

#d. What should this code print to the screen when run?

  class Student
 
    def say_hello
      puts self
    end
 
  end
 
Student.new.say_hello

#<Student:0x007ff9c403c490>

#e. What should this code print to the screen when run?

  class Student

    def say_hello
      puts say_goodbye
    end

    def say_goodbye
      "goodbye"
    end

  end

Student.new.say_hello

#goodbye
