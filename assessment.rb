#ChristopherHaack_assessment.rb
# 1. Arrays

array = ["Blake", "Ashley", "Jeff"]

# a. Add an element to an array
array.push("Chris")
# b. Write a statement to print out all the elements of the array.
array.each { |name| puts name }
# c. Return the value at index 1.
puts array[1]
# d. Return the index for the value "Jeff".
puts array.index("Jeff")
puts "end------------------------------------------------end"

# 2. Hashes
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
puts "end------------------------------------------------end"

#3 Nested Structures
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
school[:students][4] = {:name => "Jasper", grade: "A++"}
# c. Remove "Billy" from the students' array.
school[:students].delete(:name=>"Billy", :grade => "F")
# d. Add a key to every student in the students array called "semester" and assign it 
#the value "Summer".
school[:students].each { insert(-1, :semester=>"Summer") }

puts school.each { |x, y| "#{x}: #{y}" }


