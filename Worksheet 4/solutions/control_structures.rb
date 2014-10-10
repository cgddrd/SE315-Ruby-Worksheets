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
#+++solution+++
    i < 2 ? i : fib(i - 1) + fib(i - 2)
#---solution---
end

5.times do |count| puts "Exercise 1a: result of fib(#{count}) = #{fib(count)}" end
puts

# == Exercise 1b: fib using while
# Implement fib using while
#
def fib1(i)
#+++solution+++
  n = 1
  result, previous = 0, 1
  while (n <= i)
    result, previous = previous, result+previous
    n += 1
  end
  result
#---solution---
end

5.times do |count| puts "Exercise 1b: result of fib(#{count}) = #{fib1(count)}" end
puts

# == Exercise 1c: fib using for loop
# Implement fib using for loop
#
def fib2(i)
#+++solution+++
  result, previous = 0, 1
  for n in 1..i
    result, previous = previous, result+previous
  end
  result
#---solution---
end

5.times do |count| puts "Exercise 1c: result of fib(#{count}) = #{fib2(count)}" end
puts

# == Exercise 1d: fib using times method
# Implement fib using times method
#
def fib3(i)
#+++solution+++
  result, previous = 0, 1
  i.times do
    result, previous = previous, result+previous
  end
  result
#---solution---
end

5.times do |count| puts "Exercise 1d: result of fib(#{count}) = #{fib3(count)}" end
puts

# == Exercise 1e: fib using loop construct
# Implement fib using loop construct
#
def fib4(i)
#+++solution+++
  n = 1
  result, previous = 0, 1
  loop do
    break result if(n > i)
    result, previous = previous, result+previous
    n += 1
  end
#---solution---
end

5.times do |count| puts "Exercise 1e: result of fib(#{count}) = #{fib4(count)}" end
puts

# == Exercise 2: Iterator
# Write a fibonacci iterator method.
# This is a method that takes a number n and a block and then calls the block with the
# result of fib(0), fib(1) .. fib(n) You will need to decide what the block looks like
# when you call iterator
def iterator(n, &block)
#+++solution+++
  n.times do |i| block.call(fib(i)) end
#---solution---
end

puts "Exercise 2"
iterator(5) do |fib_v| puts "fib value now #{fib_v}" end
puts

# == Exercise 3: Generator
# Write a fibonacci generator class.
# This is a class that has a next method which on each call returns the next fibonacci number
class FibGenerator
#+++solution+++
  def initialize(i)
    @i = i
    @n = 0
    @result, @previous = 0, 1
  end

  def next
    return nil if (@n >= @i)
    @result, @previous = @previous, @result+@previous
    @n += 1

    @result = 1 if (@n == 2)
    @result = 0 if (@n == 1)
    @result
  end
#---solution---
end

puts "Exercise 3"
gen = FibGenerator.new(5)
while (result = gen.next)
  puts "fib value now #{result}"
end


