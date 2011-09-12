#missingint.rb
# By Richard Nygord 
# Created 9/8/2011
# Modified 9/12/2011
# Return the missing number in an array sized n containing numbers in range (1..n+1) in linear time with no additional size complexity.  Add missing_int to Array.

module MissingInt

  def self.mi ar
    return -1 if ar == []
    n=ar.length
    
    #using sign-bit in the existing array - linear + in place storage
    ar.unshift 0
    ar.push n+1
    (1..n).each {|i| ar[ar[i].abs] = -ar[ar[i].abs]}  #record not missing ones in sign-bit of index of value remebering that values must be asb-ed!
    
    res = ar.index {|v| v>0} #missing one is left positive
    ar.shift
    ar.pop
    ar.length.times {|i| ar[i] = ar[i].abs}  #ta...
    res                                      #da!
  end
end

class Array
  def missing_int
    MissingInt.mi self
  end
end


