#!/usr/bin/env ruby

class MegaGreeter

  #Create getter/setter for @names variable.
  attr_accessor :names

  # Create the object - reserved method (i.e. a constructor?)
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  
  # You can define the 
  def say_hi?
  
  	#The '?' at the end tells Ruby to treat the 'nil' object as a boolean (true/false).
    if @names.nil?
      puts "..."
      
    # Check to see if '@names' is an array by looking for an '.each' method on the object. - This is known as "DUCK TYPING", and can be more flexible than checking for an explicit type. 
    
    # Alternative check would be to check the object type of the variable: if (@names.class == Array) {}

    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
    	# If @names cannot be iterated over, just let it get turned into a string automatically and do the default greeting.
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    
    #Check if we can join the elements together (DUCK TYPING)
    elsif @names.respond_to?("join")
      # Join the list elements with commas
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

# End definition of 'MegaGreeter' class
end


# __FILE__ = Reserved Ruby variable that contains the name of the current file. 
# $0 = Reserved Ruby variables that contains the name of the file used to start the program. 

# This check says “If this is the main file being used…”. 
# This allows a file to be used as a library, and not to execute code in that context, but if the file is being used as an executable, then execute that code.
if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end