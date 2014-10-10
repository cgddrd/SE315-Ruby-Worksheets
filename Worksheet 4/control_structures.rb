#!/usr/bin/ruby
################################################################################
# This file contains exercises for the SE31520 ruby course
# Please fill in the solutions
#
# Example:
#   $ ruby -w control_structures.rb
#
################################################################################



################################################################################
# = Control Structures
# == Exercise 1a: fib using recursion
# Implement fib using recursion
#
def fib(i)  
  # CG - If the current value < 2 (i.e. 0 or 1) then we don't want to do anything as we cannot move into minus ('-') values. 
  if i < 2
      return i
  end
   
  return fib(i - 1) + fib(i - 2)
    
  # CG - Could do this in one line. -  i < 2 ? i : fib(i - 1) + fib(i - 2)
      
end
    
6.times do |count| puts "Exercise 1a: result of fib(#{count}) = #{fib(count)}" end
puts

# == Exercise 1b: fib using while
# Implement fib using while
#
def fib1(i)
  count = 1
  seed1, seed2 = 0, 1

  while (count <= i)
      # CG - Effectively we are moving everything along by one. 
      seed1, seed2 = seed2, seed1 + seed2
      count += 1
  end
    
  return seed1
    
end
5.times do |count| puts "Exercise 1b: result of fib(#{count}) = #{fib1(count)}" end
puts

# == Exercise 1c: fib using for loop
# Implement fib using for loop
#
def fib2(i)
    
 seed1, seed2 = 0, 1
    
 for number in 1..i
     seed1, seed2 = seed2, seed1 + seed2
 end 
    
 seed1 #CG - Same as doing 'return seed1'
    
end
5.times do |count| puts "Exercise 1c: result of fib(#{count}) = #{fib2(count)}" end
puts

# == Exercise 1d: fib using times method
# Implement fib using times method
#
def fib3(i)
  
  seed1, seed2 = 0, 1
    
  i.times do 
      seed1, seed2 = seed2, seed1 + seed2;
  end
    
  seed1
    
end
5.times do |count| puts "Exercise 1d: result of fib(#{count}) = #{fib3(count)}" end
puts

# == Exercise 1e: fib using loop construct
# Implement fib using loop construct
#
def fib4(i)
  # INSERT CODE HERE: more than one line, mine was seven lines.
    
  seed1, seed2 = 0, 1
  n = 1;

  loop do
      
      #CG - Break out of the loop and return the current value of 'seed1' if we have calculated all of the reuqired Fibonacci numbers.
      break seed1 if (n > i)
      
      seed1, seed2 = seed2, seed1 + seed2;
      
      n += 1
   end

end
5.times do |count| puts "Exercise 1e: result of fib(#{count}) = #{fib4(count)}" end
puts

# == Exercise 2: Iterator
# Write a fibonacci iterator method.
# This is a method that takes a number n and a block and then calls the block with the
# result of fib(0), fib(1) .. fib(n) You will need to decide what the block looks like
# when you call iterator
def iterator(n, &block)
  # INSERT CODE HERE: mine was one line.
    n.times do |i| block.call(fib(i), i) end; 
end
puts "Exercise 2"
# INSERT CALL TO iterator with block here

iterator(5) { | fib_result, count | puts "Fibbonaci value (#{count}) = #{fib_result}"}

puts

# == Exercise 3: Generator
# Write a fibonacci generator class.
# This is a class that has a next method which on each call returns the next fibonacci number
class FibGenerator
  # INSERT CODE HERE: mine has 15 lines. You can do better!
    
  def initialize(i)
    @current_number, @count, @result, @previous = i, 0, 0, 1
  end

  def next
      
    #CG - Break out of the sequence if we have calculated all of the Fibonacci numbers up to the max set by the user. 
    return nil if (@count >= @current_number)
      
    #CG - Parallel assignment. 
    @result, @previous, @count = @previous, @result+@previous, @count += 1

    # If the current number being calculated = 2 or 1 then explicity set the Fibonacci number. 
    @result = 1 if (@count == 2)
    @result = 0 if (@count == 1)
    @result
  end
    
end

puts "Exercise 3"
gen = FibGenerator.new(6)
while (result = gen.next)
  puts "fib value now #{result}"
end


