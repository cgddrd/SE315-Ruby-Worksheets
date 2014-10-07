#!/usr/bin/ruby -w

# Test unit for exercise 2 of the ruby course.
# On Windows type:  ruby -w iterators.test.rb
# Make sure your solution is in the same directory and with the name iterators.solution.rb
require './iterators'
require 'minitest/autorun'

class TC_MyTest < MiniTest::Unit::TestCase
  def test_n_times
    # Simple case
    1.upto(20) do | i |
      count = 0
      n_times(i) do count += 1 end
      assert_equal(i, count, 
                   "n_times(#{i}) should have called the block #{i} times, " + \
                   "but it called it #{count} times.")
    end

    0.downto(-20) do | i |
      n_times(i) do assert(false, "n_times(#{i}) should not have called the block.") end
    end
  end

  @@faculties = [[0, 0], [1, 1], [2, 2], [3, 6], [4, 24], [5, 120], [6, 720], [7, 5040], [8, 40320], 
                 [9, 362880], [10, 3628800], [11, 39916800], [12, 479001600], [13, 6227020800], 
                 [14, 87178291200], [15, 1307674368000], [16, 20922789888000], [17, 355687428096000], 
                 [18, 6402373705728000], [19, 121645100408832000], [20, 2432902008176640000]]
  def test_fac
    @@faculties.each do | i, i_fac | 
      assert_equal(i_fac, fac(i), "fac(#{i}) should return #{i_fac}, but it returns #{fac(i)}")
    end
  end

  @@longest_strings =[[%w(a ab abc abcd), 4],
                      [%w(ab a b abcd), 4],
                      [%w(cdef ab abc abcd), 4],
                      [%w(abd ab abf abg a), 3]]
  def test_longest_string
    @@longest_strings.each do | strings, length |
      assert_equal(length, longest_string(strings).length, 
                   "longest_strings(#{strings.inspect}) should have returned a string of " + \
                   "length #{length} but it returned #{longest_string(strings)}")
    end
  end

  def test_find_it
    assert_equal('egg', find_it(['apple', 'banana', 'egg']) { | best_so_far, this | this.length < best_so_far.length },
                 'Find it used for searching the minimum does not work')

    assert_equal('banana', find_it(['apple', 'banana', 'egg']) { | best_so_far, this | this.length > best_so_far.length },
                 'Find it used for searching the minimum does not work')
  end
end
