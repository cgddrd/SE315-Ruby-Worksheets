#!/usr/bin/ruby
################################################################################
# This file contains exercises for the SE31520 ruby course (courtesy of Brian Schroder)
# Please fill in the solutions, and test them using the iterators.tests.rb unit tests.
#
# Example:
#   $ ruby -w iterators.rb
#
################################################################################



################################################################################
# = Iterators
# == Exercise 1a: n_times
# Write an iterator function n_times(n) that calls the given block n times
# Hint: Note that the &block argument is not being passed in to n_times explicitly
# however we can use something else.
#
# Call a block n times
def n_times(n)
    # CG - ALTERNATIVE METHOD: 1.upto(n) do |i| yield() end
    
    # CG - Call the 'yield()' method however many times specified by the user (n.times).
    n.times do yield() end
end

# == Exercise 1b: Repeat
# Write an iterator class Repeat that is instantiated with a number and has a method each
# that takes a block as an argument and calls it as often as declared when creating the object

# CG - Created a new iterator class. 
class Repeat
    
  # Class "constructor"
  def initialize(n)
    @number = n
  end
  
  # CG - &block: 'Proc' parameter used to pass a "block" into method to call. 
  def each(&block)
    
    # CG - Repeat for the number of cycles defined when constructing a new 'Repeat' object (e.g. "Repeat.new(3)" - Loop three times)
    for i in 1..@number
        # CG - Run the block of code passed in when calling "Repeat.each" (e.g. "repeat.each do |val| puts val end")
        block.call(i)
    end
      
  end
end

# CG - Create a new instance of the 'Repeat' object passing in the number of times to repeat (used by the 'Repeat.each' method.)
repeat = Repeat.new(3)

# CG - 'val' variable is set to the value of the 'i' variable in the 'Repeat.each' function.
repeat.each do |val| puts val end


# == Exercise 2: Inject
# === irb
# Write a one-liner in irb using Range#inject to calculate 20!.
# Remember that 20! is the factorial of 20, i.e. fac(4) is 1*1*2*3*4 = 24
# Do not use recursion
#
# Hint: A range is written like this:
#  (1..3)   # == 1,2,3
#  (1...3)  # == 1,2

# CG - irb -> (1..20).inject(1){ |result, el| result *= el }

# === Function
# Fill in this function stub. Use the inject iterator as we saw earlier, i.e.
# it accumulates the result
#
# Make sure that values < 1 return 0
#
# Calculate n!
def fac(n)
  # INSERT CODE HERE
  # Deal with the < 1 condition first (one line of code)
  # Then deal with the normal case using an iterator (again one line of code)
    
    # CG - Check that the number to factorise is greater than 1. 
    if n >= 1
        
        # CG - Return the factorial of the range of numbers between 1 and the specified value ('n') (e.g. fac(20) -> 20!)
        # CG - We start the factorial calculation with the initial value of 1.
        # CG - 'result' = the current resulting value of the calculation (for the first iteration, 'result' is set to the value passed
        # into the 'inject()' function (e.g. in this case it would be '1')
        # CG - 'el' represents the current iteration value of the Range object (e.g. 1, 2, 3, 4 ..)
        return (1..n).inject(1){ |result, el| result *= el }
        
    end

    # CG - Otherwise, if the user specifies a factorial value of 0, return 0 as we cannot perform any calculations.
    return 0
end

# == Exercise 3: Maximum
# Write a function to find the longest string in an array. 
#
# Hint: The length of a string can be found with the method String#length.
# Example: '12345'.length => 5
#
# Fill in this function stub
#
# Find longest string in strings
def longest_string(strings)
    
  # CG - Loop through an array of strings, and return the longest word out of the collection.
  return strings.inject(){ |longestWord, currentWord| longestWord.length > currentWord.length ? longestWord : currentWord }
    
end

# == Exercise 4: find_it
# Write a function find_it that takes an array of strings and
# a block and allows to implement longest_string, shortest_string
# and other functions by changing the block.
#
# Example:
#  find_it(['apple', 'banana', 'egg']) { | best_so_far, this | this.length < best_so_far.length }
#  # => 'egg'
#  should return the shortest string.
#
#  find_it(['apple', 'banana', 'egg']) { | best_so_far, this | this.length > best_so_far.length }
#  # => 'banana'
#  should return the longest string.
def find_it(strings, &block)

    # Go through the list and call the block repeatedly (yield), using the result to update best_so_far
    # Feel free to change the partial solution if you wish. Note also that there are several ways
    # this can be solved.
    # INSERT CODE HERE: Again just a few lines of code are needed.
    
    # CG - Start with the first string in the array (used as the first comparison value)
    best_so_far = strings[0]
    
    # CG - Get the total count of all the strings in the array (so we can loop through them)
    count = (strings.length - 1)
    
    # CG - "For" loop to iterate through the string array ('strings').
    for index in 0..count
        
        # CG - Perform comparison on the current "largest word" ('best_so_far') and the current word we are processing from the array.
        
        # CG - NOTE: The actual comparison logic is provided as a parameter to 'find_it' method (called through the 'yield' method passing in the appropiate values) (e.g. "find_it(['apple', 'banana', 'egg']) { | best_so_far, this | this.length > best_so_far.length }")
        
        # CG - 'yield' is the same as 'block.call(best_so_far, strings[index])'
        if yield(best_so_far, strings[index])
            
            # CG - If the current word (strings[index]) passes the conditional (passed in via the '&block' parameter), update.
            best_so_far = strings[index]
        end
    end
    
    return best_so_far;

end
